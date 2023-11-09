// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

// 🔫 Re-Entrancy Attacks: When a function is called within a contract, it can invoke another contract's function before completing its execution.

// The Anatomy of a Re-Entrancy Attack
// 1. Vulnerable Function Call: The attacker identifies a function within the target contract that interacts with an external contract and lacks proper checks and balances.
// 2. Attack Initiation: The attacker deploys a malicious contract, equipped with a function designed to be repeatedly called.
// 3. First Re-Entrancy Call: The attacker calls the vulnerable function from their malicious contract.
// 4. Recursive Attack: The external call triggers another function in the target contract, resuming the previous execution.
// 5. Rinse and Repeat: The attacker's contract continues to call the vulnerable function before each execution completes

/* Preventive Measures Against Re-Entrancy Attacks
 🔐 Use Checks-Effects-Interactions Pattern:  separating state changes, checks, and external interactions into distinct stages.

 🚫 Avoid using `send()` and `transfer()` : Instead, use the `call.value()` function to specify the exact amount of gas to send.
     (bool success, ) = address(msg.sender).call{value: _amount}("");
     require(success, "External call failed");

 🛡️ Implement Reentrancy Guards: This can be achieved using the `nonReentrant` modifier
*/ 

// This contract EtherStore facilitates depositing and withdrawing Ether, but it's plagued by the re-entrancy vulnerability.

contract EtherStore {

    mapping(address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint bal = balances[msg.sender];
        require(bal > 0);
        (bool sent, ) = msg.sender.call{value: bal}("");
        require(sent, "Failed to send Ether");
        balances[msg.sender] = 0;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

}