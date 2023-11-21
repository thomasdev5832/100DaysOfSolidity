// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

/*
    🕒 The Temptation of Manipulation 🕒
    By altering the block timestamp, you could potentially disrupt the contract's functionality and reap illicit benefits

    📜 The Vulnerabilities and Consequences 📜
    1. Predictable Randomness Attacks
    2. Delay Exploitation
    3. Mining Manipulation
    4. Oracle Exploits
*/

/*  🎰⏳
    The Roulette smart contract exhibits a vulnerability related to the use of `block.timestamp` for determining game outcomes.
    The contract allows players to participate in a game where they win if the `block.timestamp % 15 == 0`. 
    However, this reliance on `block.timestamp` introduces a susceptibility to manipulation by miners, leading to potential unfair game outcomes.
*/

contract Roulette {

    uint public pastBlocktime;

    constructor() payable {}

    function spin() external payable {
        require(msg.value == 10 ether); // must send 10 ether to play
        require(block.timestamp != pastBlocktime); // only 1 transaction per block
    
        pastBlocktime = block.timestamp;

        if(block.timestamp % 15 == 0) {
            (bool sent, ) = msg.sender.call{value: address(this).balance}("");
            require(sent, "Failed to send Ether");
        }
    }
}