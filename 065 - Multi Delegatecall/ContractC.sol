// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract ContractC {

    uint256 public value;

    function setValue(uint256 _value) public payable {
        value = _value;
    }

}