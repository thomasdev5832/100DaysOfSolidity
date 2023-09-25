// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

// Solidity allows Constructor:
// - Overloading: contracts with multiple initialization options
// - Visibility modifiers like `public`, `private`, `internal`, and `external`

contract ContractB is ContractX("input to X"), ContractY("input to Y") {
    //
}