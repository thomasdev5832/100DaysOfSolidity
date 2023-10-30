// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract TestContract2 {

    address public owner = msg.sender;
    uint public value = msg.value;
    uint public x;
    uint public y;

    constructor(uint _x, uint _y) payable {
        x = _x;
        y = _y;
    }

}