// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

/*
The goal of KingOfEther is to become the king by sending more Ether than the previous king.
Previous king will be refunded with the amount of Ether he sent.

The KingOfEther smart contract is vulnerable to a Denial of Service (DoS) attack.
The vulnerability allows an attacker to become the king and prevent anyone else from claiming the throne by exploiting the lack of a fallback function in the Attack contract.

Vulnerability Type:
Denial of Service (DoS)
*/

contract KingOfEther {

    address public king;
    uint public balance;

    function claimThrone() external payable {
        require(msg.value > balance, "Need to pay more to become the king!");
        
        (bool sent, ) = king.call{value: balance}("");
        require(sent, "Failed to send Ether!");

        balance = msg.value;
        king = msg.sender;
    }

}