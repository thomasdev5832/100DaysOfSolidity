// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract ContractA {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}