// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

// 🛰 Minimal Proxy Contracts -> design pattern in Solidity that allows you to efficiently deploy multiple instances of the same contract by separating the contract's logic from its data. 
// The proxy serves as an interface to the logic contract, forwarding function calls and storing data in the logic contract.
// Provides a simple and gas-efficient way to deploy multiple instances of the same contract by minimizing redundant logic deployments.
// Benefits:
// ⭐ Cost-Efficiency
// ⭐ Ethereum Gas Optimization
// ⭐ Upgradability and Maintenance
// ⭐ Simplified Deployment Workflow

contract MinimalProxy {

    address public logicContract;

    constructor(address _logicContract) {
        logicContract = _logicContract;
    }

    fallback() external {
        // storing the address of the logic contract
        address target = logicContract;

        assembly {
            // forwarding all incoming calls to it via a delegate call
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