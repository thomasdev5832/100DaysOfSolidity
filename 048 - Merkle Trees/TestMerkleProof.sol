// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./MerkleProof.sol";

contract TestMerkleProof is MerkleProof {

    bytes32[] public hashes;

    constructor() {
        string[4] memory transactions = [
            "alice -> bob",
            "bob -> dave",
            "carol -> alice",
            "dave -> bob"
        ];

        for(uint i = 0; i < transactions.length; i++) {
            hashes.push(keccak256(abi.encodePacked(transactions[i])));
        }

        uint n = transactions.length;
        uint offset = 0;

        while(n > 0) {
            for(uint i = 0; i < n - 1; i+=2) {
                hashes.push(keccak256(abi.encodePacked(hashes[offset + i], hashes[offset + i + 1])));
            }
            offset += n;
            n = n / 2;
        }

    }

    function getRoot() public view returns (bytes32) {
        return hashes[hashes.length - 1];
    }

}