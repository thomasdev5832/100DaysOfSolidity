// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

// ⚡ Multi Call -> used to group multiple function calls together and execute them in a single transaction.
// Advantages of Multi Call:
// 1. Gas Efficiency ⛽️
// 2. Reduced Blockchain Bloat 🏗️
// 3. Enhanced Scalability 📈
// 4. Atomicity 🔒

contract MultiCall {

    struct Call {
        address target;
        bytes data;
    }

    // takes an array of `Call` structs as input
    function executeBatch(Call[] calldata calls) external {
        // iterates through the array, executing each function call using the low-level `call` method
        for (uint256 i = 0; i < calls.length; i++) {
            (bool success, ) = calls[i].target.call(calls[i].data);
            // If any of the calls fail, the whole transaction reverts
            require(success, "Function call failed!");
        }
    }

}