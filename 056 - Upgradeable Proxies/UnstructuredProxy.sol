// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

// ⭐ Unstructured Proxies -> don't implement EIP-1822
// This pattern the proxy contract blindly delegates calls to the logic contract without providing the context of the original message.
// the logic contract cannot access `msg.sender`, `msg.value`, or any other contextual information from the original call.

contract UnstructuredProxy {

    address private logicContract;

    constructor(address _logicContract) {
        logicContract = _logicContract;
    }

    fallback() external {
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