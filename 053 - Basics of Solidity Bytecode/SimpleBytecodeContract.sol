// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

// 🔧 Generating Bytecode from Solidity Source Code
// 1. Install Solidity Compiler: npm install -g solc
// 2. Compile Solidity Code: solc --bin SimpleBytecodeContract.sol
// 3. Obtain Bytecode: `SimpleBytecodeContract.bin` file contains the bytecode

contract SimpleBytecodeContract {

    string greetingMessage;

    constructor(string memory _greeting) {
        greetingMessage = _greeting;
    }

    function getGreeting() external view returns (string memory) {
        return greetingMessage;
    }

}