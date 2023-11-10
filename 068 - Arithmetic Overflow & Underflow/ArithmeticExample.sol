// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./SafeMath.sol"; 

/* 

🎇Arithmetic Overflow and Underflow

 🧨 When a value exceeds this range on the upper end, it results in an overflow. 
 🎈 Conversely, when a value goes below the lowest value in its range, it leads to an underflow.

 💡 Preventing Arithmetic Overflow and Underflow:
 1. SafeMath Library: This library ensures that overflows and underflows are handled correctly by reverting the transaction if such conditions are met.
 2. Checking Bounds: comparing the input values and the expected output to detect potential anomalies before they occur
 3. Use Data Types Wisely

*/

contract ArithmeticExample {
    using SafeMath for uint256;

    function safeAdd(uint256 a, uint256 b) public pure returns (uint256) {
        return a.add(b);
    }

    function safeSub(uint256 a, uint256 b) public pure returns (uint256) {
        require(a >= b, "Subtraction result would underflow");
        return a.sub(b);
    }
}