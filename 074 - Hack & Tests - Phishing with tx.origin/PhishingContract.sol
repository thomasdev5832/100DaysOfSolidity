// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

/* 
    🕵️‍♂️ Phishing with tx.origin
 tx.origin, a built-in global variable in Solidity, represents the Ethereum address that originally sent the transaction.
 tx.origin can be exploited by attackers to execute phishing attacks on unsuspecting users.

   msg.sender vs; tx.origin
- msg.sender: Represents the immediate sender of the message (current contract or external contract). This can be a user or another smart contract.
- tx.origin: Represents the original initiator of the transaction. This is the external user who initially triggered the chain of transactions.

 ☠ The attacker's contract impersonates a legitimate contract by only allowing externally owned accounts (EOAs) to call the `notifyAboutTransfer` function. 
 - the use of tx.origin makes it possible to bypass the EOA check and execute the malicious code.

 🔐 How `msg.sender` Mitigates the Vulnerability 🧰
 By using `msg.sender` in the authorization check, the contract owner can be confident that only the legitimate caller (either an EOA or contract) can trigger the function. Unlike `tx.origin`, `msg.sender` represents the immediate caller, effectively neutralizing the vulnerability.

 🛡️Remediation and Best Practices:
    1. Avoid `tx.origin`
    2. Multi-factor Verification
    3. Educational Awareness
    4. External Call Validation
*/

contract PhishingContract {

    address public trustedContract = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    function notifyAboutTransfer(uint256 amount) external {
        require(tx.origin == msg.sender, "Only externally owned accounts allowed!");
        require(msg.sender == trustedContract, "Only trusted contract can notify");
        
        // 🎈 send fake notification to user
        // ...
    
    }

}