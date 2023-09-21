// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract ViewAndPure {

    uint public x = 1;

    // View functions are designed to retrieve and return data from the blockchain without modifying the state of the contract
    // View -> read-only
    function addToX(uint y) public view returns (uint) {
        return x + y;
    }

    // Pure functions not only do they not modify the state, but they also do not read or access any state variables. 
    // Pure functions are entirely self-contained and rely only on the input parameters provided to them.
    // Pure -> entirely self-contained and independent 
    function add(uint i, uint j) public pure returns (uint) {
        return i + j;
    }

}