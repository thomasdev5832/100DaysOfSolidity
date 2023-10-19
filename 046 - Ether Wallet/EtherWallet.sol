// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract EtherWallet {

    address private owner;

    event Deposit(address indexed depositor, uint amount);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }

    // This fallback function enables the wallet to receive Ether
    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint _amount) external onlyOwner() {
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }

}