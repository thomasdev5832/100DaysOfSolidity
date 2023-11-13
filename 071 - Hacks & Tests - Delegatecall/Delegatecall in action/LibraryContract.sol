// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract LibraryContract {

    uint public value;

    function setValue(uint _newValue) external {
        value = _newValue;
    }

}