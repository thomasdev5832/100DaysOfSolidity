// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract Fallback {
    
    event Log(string func, uint gas);

    fallback() external payable {
        emit Log("fallback", gasleft());
    }

    receive() external payable {
        emit Log("receive", gasleft());
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

}