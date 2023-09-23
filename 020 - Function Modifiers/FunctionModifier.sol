// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract FunctionModifier {

    address public owner;
    uint public x = 10;
    bool public locked;

    constructor() {
        owner = msg.sender;
    }

    // Restricting Access with Modifiers
    modifier onlyOwner(){
        require(msg.sender == owner, "Not owner");
        _;
    }

    // Validating Inputs with Modifiers
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    // restricting and validating
    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }

    // Guarding Against Reentrancy Attacks
    // Reentrancy attacks -> when a malicious contract repeatedly calls back into the vulnerable contract before the previous call completes.
    modifier noReentrancy() {
        require(!locked, "No reentrancy");
        locked = true;
        _;
        locked = false;
    }

    function decrement(uint i) public noReentrancy {
        x -= i;
        if (i > 1) {
            decrement(i - 1);
        }
    }

}