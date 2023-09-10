// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract SimpleStorage {

    // State variable to store a number
    uint public num;

    // need to send a transaction to write to a state variable.
    function set(uint _num) public {
        num = _num;
    }

    // read from a state variable without sending a transaction.
    // retrieve the current value of `num` without incurring any transaction costs
    function get() public view returns (uint) {
        return num;
    }

}