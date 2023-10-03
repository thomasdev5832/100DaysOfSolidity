// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract TestFallbackInputOutput {

    event Log(bytes res);

    function test(address _fallback, bytes calldata data) external {
        
        (bool ok, bytes memory res) = _fallback.call(data);
        require(ok, "call failed");
        emit Log(res);

    }

    function getTestData() external pure returns (bytes memory, bytes memory) {
        
        return (
            abi.encodeWithSignature("get()"),
            abi.encodeWithSignature("inc()")
        );

    }

}