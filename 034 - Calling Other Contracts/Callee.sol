// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract Callee {

    uint public x;
    uint public value;

    function setX(uint _x) public returns (uint) {
        x = _x;
    }

}