// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

// Enums can also be declared outside of a contract and imported into other contracts for reuse.

 enum Status {
        Pending, 
        Shipped,
        Accepted,
        Rejected, 
        Canceled
    }