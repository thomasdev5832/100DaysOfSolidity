// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract ReceiveEther {

    // `receive()` -> is called when the transaction's `msg.data` is empty.
    // Allows contract to accept Ether transfers when no specific function is called
    receive() external payable {}

    // `fallback()` -> is called when the transaction's `msg.data` is not empty or when no other function matches the function signature.
    // Serves as a catch-all function when no other functions match the transaction's data
    fallback() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

}