// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./Proxy.sol";
import "./LargeContract.sol";

/*
    👾 Bypassing Contract Size Checks
    - Ethereum imposes a limit on the size of a contract that can be deployed to the blockchain.
    - One way to bypass the contract size check is by exploiting the delegatecall functionality. 


    🧨 How the hack works:
    1. Deploy a proxy contract that stays within the size limits.
    2. Large Contract: Deploy the actual contract that exceeds the size limits. 
    3. Delegatecall Invocation: The proxy contract uses delegatecall to execute the code residing in the larger contract.

*/

contract DeployContract {

    address public largeContract;
    address public proxyContractAddress;

    constructor() {
        // deploy the LargeContract
        largeContract = address(new LargeContract());
         // deploy the Proxy Contract, passing the address of the LargeContract
        proxyContractAddress = address(new Proxy(largeContract));
    }
}