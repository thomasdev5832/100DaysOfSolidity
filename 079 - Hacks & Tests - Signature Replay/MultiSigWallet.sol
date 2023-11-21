// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./ECDSA.sol";

/*
    ✍ Signature Replay Attacks 
    -> is a type of security vulnerability that occurs when an attacker captures a valid cryptographic signature and attempts to use it again to execute unauthorized actions.

    🚨 The Vulnerability  arises from the ability to reuse a valid cryptographic signature multiple times to execute a function within a smart contract.
*/


// Vulnerable Implementation

contract MultiSigWallet {

    using ECDSA for bytes32;

    address[2] public owners;

    constructor(address[2] memory _owners) payable {
        owners = _owners;
    }

    // ... other functions...

    function transfer(address _to, uint _amount, bytes[2] memory _sigs) external {
        bytes32 txHash = getTxHash(_to, _amount);
        require(_checkSigs(_sigs, txHash), "Invalid sig");
        (bool sent, ) = _to.call{value: _amount}("");
        require(sent, "Failed to send Ether");
    }

    // ... other functions...

}