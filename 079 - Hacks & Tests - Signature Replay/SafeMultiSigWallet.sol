// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./ECDSA.sol";

/*

   🛡️ Preventive techniques that can be implemented to secure the smart contract.    
    1. Nonce Implementation
    2. Transaction Hash Tracking

*/


// Preventative Implementation

contract MultiSigWallet {

    using ECDSA for bytes32;

    address[2] public owners;

    mapping(bytes32 => bool) public executed;

    constructor(address[2] memory _owners) payable {
        owners = _owners;
    }

    // ... other functions...

    function transfer(
        address _to,
        uint _amount,
        uint _nonce,
        bytes[2] memory _sigs
        ) external {
        bytes32 txHash = getTxHash(_to, _amount, _nonce);
        require(!executed[txHash], "tx executed");
        require(_checkSigs(_sigs, txHash), "Invalid sig");
        (bool sent, ) = _to.call{value: _amount}("");
        require(sent, "Failed to send Ether");
    }

    // ... other functions...

}