// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract SendEther {

    // 'transfer()' -> transfers a fixed amount of gas (2300 gas) and automatically throws an error if the transfer fails.
    // Is the simplest way to send Ether
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    // 'send()' ->  Is similar to `transfer` but provides a boolean return value to indicate the success or failure of the transfer.
    // Also sends a fixed amount of gas (2300 gas) and reverts if the transfer fails.
    function sendViaSend(address payable _to) public payable {
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    // 'call()' -> allows you to forward all available gas or specify a gas limit and provides a boolean return value indicating the success or failure of the transfer.
    // Is the most flexible way to send Ether and interact with other contracts.
    function sendViaCall(address payable _to) public payable {
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }

}