// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract Receiver {

    event Received(address caller, uint amount, string message);

    // fallback function -> which is triggered when the contract receives Ether without a specific function call. 
    fallback() external payable {
        emit Received(msg.sender, msg.value, "Fallback was called");
    }

    function foo(string memory _message, uint _x) public payable returns (uint) {
        emit Received(msg.sender, msg.value, _message);
        return _x + 1;
    }

}