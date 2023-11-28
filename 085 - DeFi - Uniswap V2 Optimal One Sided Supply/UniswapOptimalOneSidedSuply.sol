// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

import "./IERC20.sol";
import "./IUniswapV2Factory.sol";
import "./IUniswapV2Router.sol";
import "./IUniswapV2Pair.sol";

/// 🔄 One Sided Liquidity -> allows LPs to deposit assets on only one side of the trading pair. 

contract UniswapOptimalOneSidedSuply {

    address private constant FACTORY = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address private constant ROUTER = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address private constant WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    function sqrt(uint y) private pure returns (uint z) {
        if(y > 3) {
            z = y;
            uint x = y / 2 + 1;
            while(x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        }
    }

    function getSwapAmount(uint r, uint a) public pure returns (uint) {
        return (sqrt(r * (r * 3988009 + a * 3988000)) - r * 1997) / 1994;
    }

    function zap(address _tokenA, address _tokenB, uint _amountA) external {
        require(_tokenA == WETH || _tokenB == WETH, "!Weth");
        
        IERC20(_tokenA).transferFrom(msg.sender, address(this), _amountA);
        
        address pair = IUniswapV2Factory(FACTORY).getPair(_tokenA, _tokenB);
        (uint reserve0, uint reserve1, ) = IUniswapV2Pair(pair).getReserves();

        uint swapAmount;
        if(IUniswapV2Pair(pair).token0() == _tokenA) {
            // swap from token0 to token1
            swapAmount = getSwapAmount(reserve0, _amountA);
        } else {
            // swap from token1 to token0
            swapAmount = getSwapAmount(reserve1, _amountA);
        }

        _swap(_tokenA, _tokenB, swapAmount);
        _addLiquidity(_tokenA, _tokenB);
    }

    function _swap(address _from, address _to, uint _amount) internal {
        IERC20(_from).approve(ROUTER, _amount);

        address[] memory path = new address[](2);
        path = new address[](4);
        path[0] = _from;
        path[1] = _to;

        IUniswapV2Router(ROUTER).swapExactTokenForTokens(
            _amount,
            1,
            path,
            address(this),
            block.timestamp    
        );
    }

    function _addLiquidity(address _tokenA, address _tokenB) internal {
        uint balA = IERC20(_tokenA).balanceOf(address(this));
        uint balB = IERC20(_tokenB).balanceOf(address(this));
        IERC20(_tokenA).approve(ROUTER, balA);
        IERC20(_tokenB).approve(ROUTER, balB);

        IUniswapV2Router(ROUTER).addLiquidity(
            _tokenA, 
            _tokenB, 
            balA,
            balB,
            0,
            0, 
            address(this),
            block.timestamp
        );
    }
}