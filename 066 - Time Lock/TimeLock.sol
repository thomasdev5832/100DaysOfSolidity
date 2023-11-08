// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

// 🔒 Time Lock -> to schedule transactions to be executed after a specified waiting period has elapsed.

// 💡 Enhancing TimeLock Functionality:
// 🔒 Multi-Beneficiary Time Locks
// ⏰ Cancelable Time Locks
// 📜 Event Logging
// 🛡️ Security Measures
// 🚨 Emergency Unlock
// 🧩 Combining Time Locks with Other Smart Contracts

contract TimeLock {

    address public beneficiary;
    uint256 public releaseTime;
    uint256 public amount;

    constructor(address _beneficiary, uint256 _releaseTime, uint256 _amount) {
        beneficiary = _beneficiary;
        releaseTime = _releaseTime;
        amount = _amount;
    }

    function withdraw() public {
        require(block.timestamp >= releaseTime, "Release time not reached yet.");
        require(msg.sender == beneficiary, "You are not beneficiary.");
        (bool success, ) = beneficiary.call{value: amount}("");
        require(success, "Failed to send ether.");
    }

}