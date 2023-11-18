// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

/*
   🐝 Honeypot Vulnerability
   -> is a type of malicious smart contract that aims to deceive and trap unsuspecting users.
   -> promising high returns or exclusive features. 
   -> however, once you interact with it, the contract exploits vulnerabilities in your transaction to drain your funds.

    How the Honeypot Works:
    1. Promise of High Returns
    2. Complex Control Flow
    3. Hidden Exploit
    4. Fund Draining
    5. Quick Exit

    🛡 Protection Against Honeypots:
    1. Code Audit
    2. Minimal Trust
    3. Reputable Sources
    4. Community Feedback
    5. Transaction Reversal

*/

// In this example, the contract initially appears innocent, allowing users to invest a minimum of 1 ether.
// However, the contract secretly switches its behavior after the first investment, ensuring that subsequent investors will lose their funds.

contract Honeypot {

    bool private isVictim;

    constructor() {
        isVictim = false;
    }

    function invest() external payable {
        require(msg.value >= 1 ether, "Minimum investment required: 1 ether");
        if(isVictim) {
            payable(msg.sender).transfer(address(this).balance);
        } else {
            isVictim = true;
        }
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    fallback() external payable {
        if(isVictim) {
            payable(msg.sender).transfer(address(this).balance);
        }
    }

}