// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract PaymentContract {
    
    address payable public recipient;
    uint public amount;

    constructor(address payable _recipient, uint _amount) {
        recipient = _recipient;
        amount = _amount;
    }

    modifier onlyRecipient() {
        require(msg.sender == recipient, "Not recipient");
        _;
    }

    function releasePayment() public onlyRecipient {
        recipient.transfer(amount);
    }

    modifier validInput(uint _value) {
        require(_value > 0, "Invalid value");
        _;
    }

    modifier onlyPositiveBalance() {
        require(address(this).balance > 0, "No balance");
        _;
    }

    function withdraw(uint _value) public validInput(_value) onlyPositiveBalance {
        // Withdraw logic...
    }

}