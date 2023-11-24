// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract Proxy {

    address public target;

    constructor(address _target) {
        target = _target;
    }

    // enabling the proxy contract to behave like the target contract
    fallback() external payable {
        address _impl = target;
        assembly {
            calldatacopy(0, 0, returndatasize())
            let result := delegatecall(gas(), _impl, 0, calldatasize(), 0, 0)
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