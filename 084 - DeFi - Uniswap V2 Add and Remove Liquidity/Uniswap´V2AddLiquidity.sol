// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

import "./IERC20.sol";
import "./IUniswapV2Router.sol";
import "./IUniswapV2Factory.sol";

contract UniswapV2AddLiquidity {

    address private constant FACTORY = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address private constant ROUTER = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address private constant WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address private constant USDT = 0xdAC17F958D2ee523a2206206994597C13D831ec7;

    // add liquidity to a token pair on Uniswap V2
    function addLiquidity(
        address _tokenA,
        address _tokenB,
        uint _amountA,
        uint _amountB    
    ) external {
        // Transfer tokens to the contract
       safeTransferFrom(IERC20(_tokenA), msg.sender, address(this), _amountA);
       safeTransferFrom(IERC20(_tokenB), msg.sender, address(this), _amountB);
        
        // Approve the router to spend the transferred tokens
       safeApprove(IERC20(_tokenA), ROUTER, _amountA);
       safeApprove(IERC20(_tokenB), ROUTER, _amountB);

        // Add liquidity on Uniswap V2
       (uint amountA, uint amountB, uint liquidity) = IUniswapV2Router(ROUTER).addLiquidity(
            _tokenA,
            _tokenB,
            _amountA,
            _amountB,
            1,
            1,
            address(this),
            block.timestamp
       );
    }

    // remove liquidity from a token pair on Uniswap V2
    function removeLiquitidy(
        address _tokenA,
        address _tokenB
    ) external {
        // Get the pair address of the token pair on Uniswap V2 using the factory
        address pair = IUniswapV2Factory(FACTORY).getPair(_tokenA, _tokenB);

        // Get the contract's liquidity balance
        uint liquidity = IERC20(pair).balanceOf(address(this));
        
        // Approve the router to spend the liquidity amount
        safeApprove(IERC20(pair), ROUTER, liquidity);

        // Remove liquidity on Uniswap V2
        (uint amountA, uint amountB) = IUniswapV2Router(ROUTER).removeLiquidity(
            _tokenA,
            _tokenB,
            liquidity,
            1,
            1,
            address(this),
            block.timestamp    
        );
    }

    // transfer tokens with success verification
    function safeTransferFrom(
        IERC20 token,
        address sender,
        address recipient,
        uint amount
    ) internal {
        (bool success, bytes memory returnData) = address(token).call(
            abi.encodeWithSignature("transferFrom(address,address,uint256)", sender, recipient, amount)
        );
        require(
            success && (returnData.length == 0 || abi.decode(returnData, (bool))),
            "Transfer from fail"
        );
    }

    // approve token spending with success verification
    function safeApprove(
        IERC20 token,
        address spender,
        uint amount
    ) internal {
        (bool success, bytes memory returnData) = address(token).call(
            abi.encodeCall(IERC20.approve, (spender, amount))
        );
        require(
            success && (returnData.length == 0 || abi.decode(returnData, (bool))),
            "Approve fail"
        );
    }

}