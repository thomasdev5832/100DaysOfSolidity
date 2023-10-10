// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

// Importing local file
import "./Token.sol";

contract MyContract {

    Token private myToken;

    constructor() {

        myToken = new Token();

    }

// Rest of the contract code...

}