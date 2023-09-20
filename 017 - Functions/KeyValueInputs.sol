// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract KeyValueInputs {

    function someFuncWithManyInputs(
        uint x,
        uint y,
        uint z,
        address a,
        bool b,
        string memory c
    ) public pure returns (uint) {
        
    }

    // traditional way of calling function
    function callFunc() external pure returns (uint) {
        return someFuncWithManyInputs(1, 2, 3, address(0), true, 'c');
    }

    // using key-value pairs to specify the values for the function parameters
    function callFuncWithKeyValue() external pure returns (uint) {
        return someFuncWithManyInputs({a: address(0), b: true, c: 'c', x: 1, y: 2, z: 3});
    }

}