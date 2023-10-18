// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract UncheckedMath {

    // 'Unchecked Math" -> performs arithmetic operations without triggering error conditions for overflow and underflow
    // Benefits:
    // 1️⃣ Gas Optimization
    // 2️⃣ Performance Improvement
    // 3️⃣ Flexibility for Advanced Math Operations

   function add(uint x, uint y) external pure returns (uint) {

        unchecked {
            return x + y;
        }

   }

   function sub(uint x, uint y) external pure returns (uint) {

        unchecked {
            return x - y;
        }

   }

   function sumOfCubes(uint x, uint y) external pure returns (uint) {

        unchecked {
           uint x3 = x * x * x;
           uint y3 = y * y * y;
           return x3 + y3;
        }

   }

}