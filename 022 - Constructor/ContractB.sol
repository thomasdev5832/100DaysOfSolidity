// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./ContractX.sol";
import "./ContractY.sol";

// Solidity allows Constructor:
// - Overloading: contracts with multiple initialization options
// - Visibility modifiers like `public`, `private`, `internal`, and `external`

// Initializing Parent Contracts in the Inheritance List
contract ContractB is ContractX("input to X"), ContractY("input to Y") {
    // do something 
}