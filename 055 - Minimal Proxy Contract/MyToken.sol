// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract MyToken {

    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSuply;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint256 _totalSuply
    ) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSuply = _totalSuply;
        balanceOf[msg.sender] = _totalSuply;
    }

    // ERC20 functions...

}