// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

interface UniswapV2Factory {
    function getPair(address tokenA, address tokenB) external view returns (address pair);
}