// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

interface IUniswapV3Pool {
    function flash(
        address recipient,
        uint amount0,
        uint amount1,
        bytes calldata data
    ) external;
}