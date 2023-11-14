// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

/*

    🎲 The Randomness Challenge
    -> Without a reliable source of randomness, smart contracts could be vulnerable to exploits, jeopardizing the security and fairness of applications

    ⚙️ Secure Sources of Randomness:
    1. Block Hashes
    2. Oracles
    3. Commit-Reveal Schemes
    4. Randomness Contracts

    🔐 Implementing a Secure Randomness Generator
    -> To achieve secure randomness using a hybrid approach combining block hashes and a randomness contract:
    1. Block Hash Initialization
    2. User Participation
    3. Block Hash Collection
    4. Reveal and Calculate

    🛡️ Ensuring Security
    -> the following steps are crucial:
    1. Commitment Verification
    2. Block Hash Unpredictability
    3. Deposits and Penalties

*/

// Contract for secure randomness generation
contract RandomnessGenerator {

    address public owner;
    bytes32 public lastBlockHash;
    uint public numberOfCommitments;
    mapping(address => bytes32) public commitments;

    constructor() {
        owner = msg.sender;
        lastBlockHash = blockhash(block.number - 1);
        numberOfCommitments = 0;
    }

    function submitCommitment(bytes32 commitment) public payable {
        require(msg.value > 0.01 ether, "Deposit required!");
        commitments[msg.sender] = commitment;
        numberOfCommitments++;
    }

}