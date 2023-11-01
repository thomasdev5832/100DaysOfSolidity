// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

// ⭐ Uni-Directional Payment Channel: type of payment channel where transactions can only flow in one direction, from the sender to the receiver.

// How it works:
// 🔓 Opening the Payment Channel
// ⚡ Updating the Payment Channel
// 🚪 Closing the Payment Channel
// ⚖️ Challenge Mechanism 

contract UniDirectionalPaymentChannel {

    address public sender;
    address public receiver;
    uint256 public channelCapacity;
    uint256 public expiration; // time when the channel can be settled on-chain
    bool public channelClosed;
    uint256 public balance;

    constructor(address _receiver, uint256 _channelCapacity, uint256 _expiration) {
        sender = msg.sender;
        receiver = _receiver;
        channelCapacity = _channelCapacity;
        expiration = block.timestamp + _expiration;
        channelClosed = false;
        balance = _channelCapacity;
    }

    modifier onlySender() {
        require(msg.sender == sender, "Only the sender can call this function.");
        _;
    }

    modifier onlyReceiver() {
        require(msg.sender == sender, "Only the receiver can call this function");
        _;
    }

    modifier channelNotClosed() {
        require(!channelClosed, "The channel has already been closed.");
        _;
    }

    function closeChannel() public onlyReceiver channelNotClosed {
        require(block.timestamp >= expiration, "The channel is still in the challenge period.");
        channelClosed = true;
    }

    function settleChannel() public channelNotClosed {
        require(msg.sender == sender || msg.sender == receiver, "Only the sender or the receiver can settle the channel.");
        selfdestruct(payable(receiver));
    }

}