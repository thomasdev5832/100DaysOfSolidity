// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./Counter.sol";

/*  

    Echidna: The Fuzzing Marvel 🦔
    -> Echidna is a sophisticated fuzz testing tool developed by Trail of Bits specifically for Ethereum smart contracts. 
    -> Fuzzing involves feeding a program with random or semi-random inputs to expose unexpected behaviors and vulnerabilities. 

*/

contract TestCounter is Counter {

    /*
        @dev Tests if Counter.count is always <= 5
        @return Returns true if the condition is met, otherwise returns false
    */

    function echidna_test_count() public view returns (bool) {
        return count <= 5;
    }

}