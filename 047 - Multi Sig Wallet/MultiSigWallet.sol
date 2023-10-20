// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract MultiSigWallet {
 
    //addresses of all wallet owners
    address[] private owners;

    // Nested mapping to track of the approvals for each transaction
    // -> transaction ID as the key and the inner mapping maps each owner's address to a boolean value indicating their approval status
    mapping(uint256 => mapping(address => bool)) private approvals;

    // number of approvals required
    uint256 private requiredApprovals;

    constructor(address[] memory _owners, uint256 _requiredApprovals) {

        owners = _owners;
        requiredApprovals = _requiredApprovals;

    }

    function submitTransaction(uint256 transactionId) external {
        // Logic to create and store the transaction
    }

    function approveTransaction(uint transactionId) external {
        // Logic to approve the transaction
    }

    function revokeTransaction(uint transactionId) external {
        // Logic to revoke the approve of a transaction
    }

    function executeTransaction(uint transactionId) external {
        // Logic to execute a transaction
    }

}
