// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

// ⭐ Transparent Proxies implement the EIP-1822 standard
// -> The transparent proxy pattern allows the proxy contract to pass the function call's context to the logic contract, preserving the original message sender and value. 

// The architecture consists of the following key components:
// 1️⃣ Proxy Contract
// 2️⃣ Logic Contract
// 3️⃣ Storage Slot

contract TransparentProxy {

    address private logicContract;

    constructor(address _logicContract) {
        logicContract = _logicContract;
    }

    fallback() external payable {
        address target = logicContract;
        assembly {
            calldatacopy(0, 0, calldatasize())
            let result := delegatecall(gas(), target, 0, calldatasize(), 0, 0)
            returndatacopy(0, 0, returndatasize())
            switch result
            case 0 {
                revert(0, returndatasize())
            }
            default {
                return(0, returndatasize())
            }
        }
    }

}