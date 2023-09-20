// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract Function {

    function returnMany() public pure returns (uint, bool, uint) {
        return (1, true, 2);
    }

    // Destructuring assignments extract values from multiple returns or assignments
    // useful when we call another function that returns multiple values
    function destructuringAssignments() public pure returns (uint, bool, uint, uint, uint){
        (uint i, bool b, uint j) = returnMany();
        // selectively extract values by leaving some positions empty during assignment
        (uint x, , uint y) = (4, 5, 6);
        return (i, b, j, x, y);
    }

    // Cannot use map for either input or output
    // array for input
    function arrayInput(uint[] memory _arr) public {
        // do something
    }
   
    uint[] public arr;
    // array for output
    function arrayOutput() public view returns (uint[] memory) {
        return arr;
    }

}