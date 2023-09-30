// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

// Interface characteristics:
// 1️⃣ Cannot have any functions implemented. They only serve as a blueprint for other contracts to follow.
// 2️⃣ Can inherit from other interfaces, allowing for composition and reusability of function signatures.
// 3️⃣ All declared functions must be external, can only be called from outside the contract.
// 4️⃣ Cannot declare a constructor
// 5️⃣ Cannot declare state variables

interface ICounter {
    
    function count() external view returns (uint);

    function increment() external;

}