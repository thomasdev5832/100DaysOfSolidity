// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./ContractA.sol";

contract ContractB is ContractA {

    // To override an inherited state variable, we need to assign a new value to it using a constructor or other appropriate methods 
    constructor() {
        //  inherits and overrides the `name` state variable inside its constructor. 
        name = "Contract B";
    }

    // C.getName returns "Contract B"

}