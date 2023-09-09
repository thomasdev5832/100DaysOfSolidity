// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract Variables {

    // state variables -> stored in blockchain
    string public text = "Hello";
    uint public num = 123;

    function doSomething() public {
        
        // local variable -> only scope functions
        uint i = 456;

        // global variables -> provide important info about blockchain and transaction context
        // global variables inside local variables
        uint timestamp = block.timestamp;
        address sender = msg.sender;

    }

}

