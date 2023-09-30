// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./UniswapV2Factory.sol";
import "./UniswapV2Pair.sol";

contract UniswapExample {

    address private factory = 0x9d085bB91A6cb7cfD4652fa2687a27CBF66f7FE9;
    address private dai = 0x8c76B57b3272a6e6078220DfcE0d522239bf7D01;
    address private weth = 0xe8A10FD9dB9E4658DAfb4a0bb74B8266ECb220cE;

    function getTokenReserves() external view returns (uint, uint) {
        address pair = UniswapV2Factory(factory).getPair(dai, weth);
        (uint reserve0, uint reserve1, ) = UniswapV2Pair(pair).getReserves();
        return (reserve0, reserve1);
    }

}