// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./ERC20/ERC20.sol";

contract SampleToken is ERC20 {

    constructor() ERC20("Sample Token", "SMP") {
        _mint(msg.sender, 1000000 * 10**decimals());
    }

}