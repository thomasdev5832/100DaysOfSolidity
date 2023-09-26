// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./ContractA.sol";

contract ContractB is ContractA {
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}