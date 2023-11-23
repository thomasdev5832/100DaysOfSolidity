// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract Proxy {

    address public targetContract;

    constructor(address _targetContract) {
        targetContract = _targetContract;
    }

    fallback() external {
        (bool success, ) = targetContract.delegatecall(msg.data);
        require(success, "Delegatecall failed");
    }

}