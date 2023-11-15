// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

/*
   🔒 KingOfEther with preventatives techniques against DoS attacks
*/

contract KingOfEther {

    address public king;
    uint public balance;
    mapping(address => uint) public balances;

    // Access Control and Role-Based Permissions
    modifier onlyKing {
        require(msg.sender == king, "Only the current king can perform this action!");
        _;
    }

    modifier onlyNonKing {
        require(msg.sender != king, "Current king cannot perform this action!");
        _;
    }

    // The `claimThrone` function should be restricted to only allow non-kings to participate.
    function claimThrone() external payable onlyNonKing() {
        require(msg.value > balance, "Need to pay more to become the king!");
        
        balances[king] += balance;

        balance = msg.value;
        king = msg.sender;
    }

    // The `withdraw` function should be restricted to only allow non-kings to withdraw their balances.
    function withdraw() public onlyKing() {
        require(msg.sender != king, "Current king cannot withdraw!");

        uint amount = balances[msg.sender];
        balances[msg.sender] = 0;

        // Safe Ether Transfer Patterns
        // This pattern ensures that state changes are made before interacting with external contracts. 
        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Failed to send Ether!");
    }

    // Fallback Function and Reentrancy Mitigation
    // This prevents external contracts from initiating calls to the contract's functions during ongoing execution.
    fallback() external {
        revert("Fallback function not allowed");
    }

}