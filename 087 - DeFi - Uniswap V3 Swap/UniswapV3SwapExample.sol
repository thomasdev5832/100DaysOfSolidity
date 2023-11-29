// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

import "./IERC20.sol";
import "./IWETH.sol";
import "./ISwapRouter.sol";

contract UniswapV3SwapExample {

    ISwapRouter constant router = ISwapRouter(0xE592427A0AEce92De3Edee1F18E0157C05861564);
    
    // 💡 Single-hop swaps are efficient when there's a direct route between the input and output tokens in the Uniswap pool.
    function swapExactInputSingleHop(
        address tokenIn,
        address tokenOut,
        uint24 poolFee,
        uint amountIn
    ) external returns (uint amountOut) {
        IERC20(tokenIn).transferFrom(msg.sender, address(this), amountIn);
        IERC20(tokenIn).approve(address(router), amountIn);

        ISwapRouter.ExactInputSingleParams memory params = ISwapRouter.ExactInputSingleParams({
            tokenIn: tokenIn,
            tokenOut: tokenOut,
            fee: poolFee,
            recipient: msg.sender,
            deadline: block.timestamp,
            amountIn: amountIn,
            amountOutMinimum: 0,
            sqrtPriceLimitX96: 0 
        });
        amountOut = router.exactInputSingle(params);
    }

    // 💡 Multi-hop swaps are useful when there's no direct trading pair between the tokens you want to exchange.
    function swapExactInputMultiHop(
        bytes calldata path,
        address tokenIn,
        uint amountIn
    ) external returns (uint amountOut) {
        IERC20(tokenIn).transferFrom(msg.sender, address(this), amountIn);
        IERC20(tokenIn).approve(address(router), amountIn);

        ISwapRouter.ExactInputParams memory params = ISwapRouter.ExactInputParams({
            path: path,
            recipient: msg.sender,
            deadline: block.timestamp,
            amountIn: amountIn,
            amountOutMinimum: 0
        });
        amountOut = router.exactInput(params);
    }

}