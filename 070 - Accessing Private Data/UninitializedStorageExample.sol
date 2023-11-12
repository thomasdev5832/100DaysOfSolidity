// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

// 🔍 Vulnerabilities and Exploits:

// Example 1: The Uninitialized Storage Exploit 📦 

// To prevent this, developers must ensure proper initialization and handling of all storage variables.

contract UninitializedStorageExample {

    string private sensitiveData; // private data

    function setData(string memory _data) public {
        sensitiveData = _data;
    }

    function getData() public view returns (string memory) {
        return sensitiveData;
    }

}