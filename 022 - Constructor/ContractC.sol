// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./ContractX.sol";
import "./ContractY.sol";

contract ContractC is ContractX, ContractY {
    // Initializing Parent Contracts in the Derived Contract's Constructor
    constructor(string memory _name, string memory _text) ContractX(_name) ContractY(_text) {
        // do something
    }
}