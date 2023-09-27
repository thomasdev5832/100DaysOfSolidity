// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract ContractA {

    string public name = "Contract A";

    function getName() public view returns (string memory) {
        return name;
    }

}