// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract Event {

    // Events -> to emit and record information from a smart contract to the Ethereum blockchain
    // Useful: User Interface Updates and Cost-Effective Storage
    
    // Event declaration: up to 3 parameters can be indexed
    // indexed parameters help filter the logs
    event Log(address indexed sender, string message);
    event AnotherLog();

    function test() public {
        emit Log(msg.sender, "Hello, World!");
        emit Log(msg.sender, "Hello, EVM!");
        emit AnotherLog();
    }

}