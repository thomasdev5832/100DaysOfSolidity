// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

/*
🛡️ Fortifying Your Contracts: Best Practices:
🔒 Initialization: Always initialize your storage variables properly.
⏳ Avoid Timestamp Dependence: minimize reliance on timestamps for critical operations.
🔐 Visibility Modifiers
🚫 Avoiding Sensitive Data
*/

// 🔍 Vulnerabilities and Exploits:

// Example 2: Timestamp Dependence Exploit ⌛

// If an attacker can manipulate the contract's timestamp, they might prematurely release funds or execute other unauthorized actions.

contract TimestampDependenceExample {

    uint256 private releaseTimestamp;
    uint256 private fundsToRelease = 1 ether;

    constructor(uint256 _releaseTimestamp) {
        releaseTimestamp = _releaseTimestamp;
    }
    
    function releaseFunds() public {
        require(block.timestamp >= releaseTimestamp, "Funds are not yet released");
        // transfer funds
        address payable recipient = payable(msg.sender);
        recipient.transfer(fundsToRelease);
    }

}