// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

// note: deploy this contract first

contract ContractB {

    // note: storage layout must be the same as contractA

    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }

}