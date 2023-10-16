// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract GasGolf {

    // ⛽🔥 Gas optimization involves minimizing the amount of gas required to execute a smart contract. 🚀
    
    // Some techniques to reduce the gas consumption:

    uint public total;

    // 📌 Replacing 'memory' with 'calldata' if need to read function arguments and not modify them
    // Reading from `calldata` is cheaper than reading from `memory`.
    function sumIfEvenAndLessThan99(uint[] calldata nums) external {
        
        // 📌 Loading state variables to memory
        // Minimizes the number of storage reads, resulting in reduced gas consumption.
        uint _total = total;

        // 📌 Caching Array Elements
        // Instead of calling 'nums.length' repeatedly, store the length in a separate variable and use it within the loop.
        uint len = nums.length;

        for(uint i = 0; i < len; ) {
            uint num = nums[i];

            // 📌 Short Circuit Evaluation
            // if the outcome of a condition can be determined early, the evaluation can be stopped, and the subsequent conditions are not evaluated. 
            if(num % 2 == 0 && num < 99) {
                _total += num;
            }

            unchecked {
                // 📌 Replacing 'i++' with '++i'
                // the prefix increment operator does not need to return the original value, resulting in reduced gas consumption.
                ++i;
            }
        }
        total = _total;
    }

}