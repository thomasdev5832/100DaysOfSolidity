// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./ECDSA.sol";
import "./SampleToken.sol";

// Gasless Token Transfer is a powerful solution to mitigate the burden of gas fees for users when interacting with ERC20 tokens. 
// 💡 How Gasless Token Transfer Works:
// 1. Approve and Deposit
// 2. Create Transaction
// 3. Relayer's Role
// 4. Execute Transaction
// 5. Reward for Relayer

contract GasLessTokenTransfer {

    using ECDSA for bytes32;
    SampleToken private _token;
    address private _owner;

    constructor(address tokenAddress) {
        _token = SampleToken(tokenAddress);
        _owner = msg.sender;
    }

    // Implement the deposit function to allow users to deposit tokens into the vault
    function deposit(uint256 amount) external {
        require(amount > 0, "Amount must be greater than zero.");
        _token.transferFrom(msg.sender, address(this), amount);
    }

    // Implement the transfer function for meta transactions
    function transfer(
        address recipient,
        uint256 amount,
        uint256 nonce,
        bytes calldata signature
    ) external {
        bytes32 message = keccak256(abi.encodePacked(recipient, amount, nonce));
        require(_verify(message, signature), "Invalid signature");
        require(_token.balanceOf(address(this)) >= amount, "Insufficient balance");
        // perform the token transfer
        _token.transfer(recipient, amount);
    }

    // Internal function to verify the signature of the meta transaction
    function _verify(bytes32 message, bytes memory signature) internal view returns (bool) {
        address signer = message.recover(signature);
        return signer == _owner;
    }


}