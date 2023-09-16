// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract Arrays {

    // Array Initialization

    // Dynamic-sized
    uint[] public arr;
    uint[] public arr2 = [1, 2, 3];

    // Fixed-sized
    uint[10] public myFixedSizeArr;


    // Access and Modification
    
    // Accessing Elements
    function get(uint i) public view returns (uint) {
        // retrieve the value at a specific index `i`
        return arr[i];
    }

    // Returning the Entire Array
    function getArr() public view returns (uint[] memory) {
        // returns the entire `arr` array
        return arr;
    }
    
    // Appending Elements
    function push(uint i) public {
        // appends a new element `i` to the end, increasing its length by one
        arr.push(i);
    } 

    // Removing Elements
    function pop() public {
        // removes the last element, decreasing its length by one
        arr.pop();
    }

    // Array Length
    function getLength() public view returns (uint) {
        // returns the current length 
        return arr.length;
    }

    // Deleting Elements
    function remove(uint index) public {
        // deletes the element at the specified index
        // The `delete` keyword resets the value to its default (0 in this case) without changing the array length
        delete arr[index];
    }

    // Working with Memory Arrays
    // useful when you need to create temporary arrays within a function
    function examples() external pure {
        // create a memory array with a fixed size of 5
        uint[] memory a = new uint[](5);
    }

}