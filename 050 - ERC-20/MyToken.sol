// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./ERC20.sol";

contract MyToken is ERC20 {

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        // mint 100 tokens to the contract deployer (msg.sender)
        _mint(msg.sender, 100 * 10 ** uint(decimals()));
    }

}