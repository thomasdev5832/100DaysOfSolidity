// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./Proxy.sol";
import "./ContractA.sol";
import "./ContractB.sol";

contract DeployAndTest {

    Proxy public proxyA;
    Proxy public proxyB;
    ContractA public proxyAContract;
    ContractB public proxyBContract;

    constructor() {
        // Deploy proxy and link to ContractA
        proxyA = new Proxy(address(new ContractA()));
        // Deploy proxy and link to ContractB
        proxyB = new Proxy(address(new ContractB()));

        // Initialize instances of ContractA and ContractB
        proxyAContract = ContractA(proxyA.target());
        proxyBContract = ContractB(proxyB.target());
    }

    // Interacting with ProxyA
    function interactWithProxyA() public {
        proxyAContract.setA(42);
    }

    // Interacting with ProxyB
    function interactWithProxyB() public {
        proxyBContract.setMessage("Hello, Solidity wizards!");
    }
}