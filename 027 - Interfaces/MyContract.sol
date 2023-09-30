// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./ICounter.sol";

contract MyContract {

    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns (uint) {
        return ICounter(_counter).count();
    }

}