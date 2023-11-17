// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract Mal {

    event Log(string message);

    function log() public {
        emit Log("Mal was called!");
    }

}