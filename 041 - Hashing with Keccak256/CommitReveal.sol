// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract CommitReveal {

    bytes32 public commitment;
    bool public revealed;

    function commit(bytes32 hash) external {
        require(!revealed, "CommitReveal: Already revealed");
        commitment = hash;
    }

    function reveal(uint256 value) external {
        require(!revealed, "CommitReveal: Alreadt reveled");
        // Keccak256 -> cryptographic hash function
        // Keccak256 takes an input of any length and produces a 256-bit (32-byte) hash as output. 
        require(keccak256(abi.encodePacked(value)) == commitment, "CommitReveal: Invalid reveal");
        revealed = true;
    }

}

