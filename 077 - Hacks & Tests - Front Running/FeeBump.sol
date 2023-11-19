// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

// Front Running: malicious actor exploiting advanced knowledge about pending transactions to gain an unfair advantage. 
// -< involves observing transactions that are about to be included in the blockchain, and then quickly executing a transaction that benefits from the upcoming change in state.

// Mitigating Front Running Risks:
// Fee Bumping: allow users to increase their transaction's gas fees after submission.

contract FeeBump {

    mapping(address => uint256) public pendingTransactions;

    function submitTransaction(uint256 amount, uint256 gasPrice) external {
        pendingTransactions[msg.sender] = gasPrice;
        if(gasPrice > pendingTransactions[msg.sender]) {
            pendingTransactions[msg.sender] = gasPrice;
        }
    }

}
