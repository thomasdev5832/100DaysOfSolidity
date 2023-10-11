// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./Math.sol";

contract TestMath {
    function testSquareRoot(uint x) public pure returns (uint) {
        return Math.sqrt(x);
    }
}