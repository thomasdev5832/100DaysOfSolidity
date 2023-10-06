// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract FunctionSelector {

    // Function Selector -> unique identifier for each function within a contract 
    // First 4 bytes of the 'calldata' function
    // Acts as a lookup key, allowing the EVM to locate the desired function efficiently.

    // To generate a function selector with 'keccak256'
    // This function takes a string `_func` as input and returns the corresponding function selector. 
    function getSelector(string calldata _func) external pure returns (bytes4) {
        // 'bytes4' -> fixed-sized array of 4 bytes to represent function selectors
        // 'keccak256' -> computes the Keccak-256 hash of a given input
        //  The resulting hash is then cast to a 'bytes4' type, representing the function selector.
        return bytes4(keccak256(bytes(_func)));
       }

}