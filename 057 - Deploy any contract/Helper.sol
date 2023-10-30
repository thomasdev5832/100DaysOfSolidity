// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./TestContract1.sol";
import "./TestContract2.sol";

// The `Helper` contract provides utility functions that assist in generating bytecode and calldata related to the other contracts.

contract Helper {

    function getByteCode1() external pure returns (bytes memory) {
        bytes memory bytecode = type(TestContract1).creationCode;
        return bytecode;
    }

    function getByteCode2(uint _x, uint _y) external pure returns (bytes memory) {
        bytes memory bytecode = type(TestContract2).creationCode;
        return abi.encodePacked(bytecode, abi.encode(_x, _y));
    }

    function getCalldata(address _owner) external pure returns (bytes memory) {
        return abi.encodeWithSignature("setOwner(address)", _owner);
    }

}