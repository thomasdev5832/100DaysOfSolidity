// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./Callee.sol";

contract LowLevelCaller {

    // Low-level call function
    // Allows contracts to communicate with each other across different networks or blockchains.

    function setXFromAddress(address _addr, uint _x) public {
        Callee callee = Callee(_addr);
        callee.setX(_x);
    }

    function setXandSendEther(Callee _callee, uint _x) public payable {
        (uint x, uint value) = _callee.setXandSendEther{value: msg.value}(_x);
    }

}