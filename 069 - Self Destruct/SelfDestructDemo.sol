// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

// 💥 Self Destruct -> allows a contract to terminate itself and send any remaining Ether balance to a designated target address.

contract SelfDestructDemo {

    address payable public beneficiary;
    
    constructor(address payable _beneficiary) {
        beneficiary = _beneficiary;
    }

    function terminate() external {
        require(msg.sender == beneficiary, "Only the beneficiary can terminate the contract.");
        selfdestruct(beneficiary);
    }

}