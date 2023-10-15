// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

/* Signature Verification

How to Sign and Verify:

# Signing
1. Create message to sign
2. Hash the message
3. Sign the hash (off chain, keep your private key secret)

# Verify
1. Recreate hash from the original message
2. Recover signer from signature and hash
3. Compare recovered signer to claimed signer

*/

contract VerifySignature {

    /* 1. Unlock Metamask account
    ethereu.enable() 
    */

    /* 2. Get message hash to sign 
    getMessageHash (
        0x12004324023...,
        123,
        "coffee and donuts",
        1
    )

    hash = "0xcfadsh734gda7sah873943j3486cdh4j2d78363td4..."
    */

    function getMessageHash(
        address _to,
        uint _amount,
        string memory _message,
        uint _nonce
    ) public pure returns (bytes32)  {
        return keccak256(abi.encodePacked(_to, _amount, _message, _nonce));
    }

    /* 
    3. Sign message hash
    # using browser
    account = "copy paste account of signer here"
    ethereum.request({ method: "personal_sign", params: [account, hash]}).then(console.log)

    # using web3
    web3.personal.sign(hash, web3.eth.defaultAccount, console.log)

    # Signature will be different for different accounts
    */

    function getEthSignedMessageHash(bytes32 _messageHash) public pure returns (bytes32) {
        // Signature is produced by signing a keccak256 hash with the following format: "\x19Ethereum Signed message"
        return keccak256(abi.encodePacked("\x19Ethereum Signed message", _messageHash)); 
    }

    /*
    4. Verify signature
    signer = 0xB23idh87sh4d9sadB4...
    _to = 0xA48dnc9nsd9fsdnsd89...
    amount = 213
    message = "coffee and donuts"
    sigfnature = 0x998d9d9a1228dzmlwq65eqqwnwq7sdqw0e9wqbdas71991hsd809482hdsas9dsahsd...

    */

    function verify(
        address _signer,
        address _to,
        uint _amount,
        string memory _message,
        uint _nonce,
        bytes memory signature
    ) public pure returns (bool) {
        bytes32 messageHash = getMessageHash(_to, _amount, _message, _nonce);
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);
        return recoverSigner(ethSignedMessageHash, signature) == _signer;
    }

    function recoverSigner(
        bytes32 _ethSignedMessageHash,
        bytes memory _signature
        ) public pure returns (address) {
            (bytes32 r, bytes32 s, uint256 v) = splitSignature(_signature);
            return ecrecover(_ethSignedMessageHash, v, r, s);
    }

    function splitSignature(bytes memory sig) public pure returns (bytes32 r, bytes32 s, uint v) {
        require(sig.length == 65, "Invalid signature length");
        assembly {
            r := mload(add(sig, 32))
            s := mload(add(sig, 64))
            v := byte(0, mload(add(sig, 96)))
        }

        // implicity return (r, s, v)

    }

}
