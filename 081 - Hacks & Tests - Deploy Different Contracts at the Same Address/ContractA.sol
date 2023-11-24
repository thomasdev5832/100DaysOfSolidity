// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract ContractA {

    uint256 public a;

    function setA(uint256 _a) external {
        a = _a;
    }

}