// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./ContractA.sol";

contract ContractC is ContractA {

    constructor() {
        name = "Contract C";
    }

    modifier overrideName() {
        name = "Modified name";
        _;
    }

    function getName() public view overrideName returns (string memory) {
        return name;
    }

}