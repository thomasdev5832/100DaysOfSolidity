// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract Factory {

    event Log(address addr);

    // Deploy a contract that always returns 42
    function deploy() external {
        bytes memory bytecode = hex"69602a60005260206000f3600052600a6016f3";
        address addr;
        // low-level assembly code
        assembly {
            // `create()` function creates a new contract instance and returns its address
            addr := create(0, add(bytecode, 0x20), 0x13)
        }
        require(addr != address(0));
        emit Log(addr);
    }

}