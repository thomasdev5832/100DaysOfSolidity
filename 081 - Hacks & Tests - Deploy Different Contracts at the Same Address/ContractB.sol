// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract ContractB {

    string public message;

    function setMessage(string memory _message) external {
        message = _message;
    }

}
