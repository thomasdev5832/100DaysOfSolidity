// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract Bar {

    function tryCatchNewContract(address _owner) public {
        try new Foo(_owner) returns (Foo foo) {
            emit Log("Foo created");
        } catch Error(string memory reason) {
            emit Log(reason);
        } catch (bytes memory reason) {
            emit Log(bytes);
        }
    }
}