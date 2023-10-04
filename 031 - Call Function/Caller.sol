// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract Caller {
    
    event Response(bool success, bytes data);

    // Few reasons why "Call" is not recommended for existing functions in other contracts:
    // 1️⃣ Reverts are not bubbled up: any revert that occurs within the called function will not bubble up to the calling contract.
    // 2️⃣ Type checks are bypassed: when using "call", type checks for function parameters are bypassed. 
    // 3️⃣ Function existence checks are omitted:  If the function does not exist or has been renamed, the "call" will trigger the fallback function instead, potentially leading to unintended behavior.

    function testCallFoo(address payable _addr) public payable {
        // The response from the "call" is stored in "success" and "data"
        // _addr.call -> specifies the target contract address 
        // {value: msg.value, gas: 5000} -> specifies the Ether value to send and the gas limit
        (bool success, bytes memory data) = _addr.call{value: msg.value, gas: 5000}(
            // The function signature and parameters are encoded using "abi.encodeWithSignature"
            // invoke the "foo" function in the Receiver contract.
            abi.encodeWithSignature("foo(string, uint256)", "call foo", 123)
        );
        emit Response(success, data);
    }

    function testCallDoesNotExist(address payable _addr) public payable {
        // Shows what happens when "call" is used to invoke a non-existing function.
        // the fallback function in the Receiver contract is triggered
        (bool success, bytes memory data) = _addr.call{value: msg.value}(
            abi.encodeWithSignature("doesNotExist()")
        );
        emit Response(success, data);
    }

}
