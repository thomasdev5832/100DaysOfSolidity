// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./MyToken.sol";
import "./MinimalProxy.sol";

contract MainContract {
    MyToken public logicContract;
    MinimalProxy public proxyContract;

    constructor() {
        // Deploy do contrato lógico (MyToken)
        logicContract = new MyToken("My Token", "MTK", 18, 1000000);

        // Deploy do contrato de proxy (MinimalProxy) com o endereço do contrato lógico como argumento
        proxyContract = new MinimalProxy(address(logicContract));
    }
}