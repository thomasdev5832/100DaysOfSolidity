// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

import "./IUniswapV2Callee.sol";
import "./IWETH.sol";
import "./IERC20.sol";
import "./IUniswapV2Pair.sol";
import "./IUniswapV2Factory.sol";

contract UniswapV2FlashSwap is IUniswapV2Callee {

    address private constant UNISWAP_V2_FACTORY = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address private constant DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address private constant WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    IUniswapV2Factory private constant factory = IUniswapV2Factory(UNISWAP_V2_FACTORY);
    IERC20 private constant weth = IERC20(WETH);
    IUniswapV2Pair private immutable pair;

    // For this example, store the amount to repay
    uint public amountToRepay;

    constructor() {
        pair = IUniswapV2Pair(factory.getPair(DAI, WETH));
    }

    function flashSwap(uint wethAmount) external {
        // need to pass some data to trigger uniswapV2call
        bytes memory data = abi.encode(WETH, msg.sender);

        // amount0Out is DAI, amount1Out is WETH
        pair.swap(0, wethAmount, address(this), data);
    }

    // this function is called by the WETH/DAI pair contract
    function uniswapV2Call(
            address sender, 
            uint amount0, 
            uint amount1, 
            bytes calldata data
        ) external {
        require(msg.sender == address(pair), "not pair");
        require(sender == address(this), "not sender");
        (address tokenBorrow, address caller) = abi.decode(data, (address, address));

        // Custom code would go here. For example, code to arbitrage
        require(tokenBorrow == WETH, "Token borrow != WETH");

        // about 0.3% fee, +1 to round up
        uint fee = (amount1 * 3) / 997 + 1;
        amountToRepay = amount1 + fee;

        // transfer flash swap fee from caller
        weth.transferFrom(caller, address(this), fee);

        // repay
        weth.transfer(address(this), amountToRepay);
    }

}