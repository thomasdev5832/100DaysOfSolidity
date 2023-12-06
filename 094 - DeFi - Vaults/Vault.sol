// SPDX-License-Identifier: MIT  

pragma solidity ^0.8.2;

import "./IERC20.sol";

/* 

    🔒 Vault is a solid piece of engineering designed to manage assets securely.

    Use cases and real-world examples:
    - Yield Farming Vaults
    - Liquidity Provision Vaults
    - Options Vaults
    - Governance Vaults

    🌐The Magic of Token Shares: The Vault contract operates by using token shares instead of directly managing token balances. 
        Benefits of Token Shares:
            🚀 Efficiency and Flexibility
            🛡️ Security

*/

contract Vault {

    IERC20 public immutable token;

    uint public totalSupply;
    mapping(address => uint) public balanceOf;

    constructor(address _token) {
        token = IERC20(_token);
    }

    // increases the total supply and the balance of shares for a specified address.
    function _mint(address _to, uint _shares) private {
        totalSupply += _shares;
        balanceOf[_to] += _shares;
    }

    // decreases the total supply and the balance of shares for a specified address.
    function _burn(address _from, uint _shares) private {
        totalSupply -= _shares;
        balanceOf[_from] -= _shares;
    }

    function deposit(uint _amount) external {
        uint shares;
        if(totalSupply == 0) {
            shares = _amount;
        } else {
            shares = (_amount * totalSupply) / token.balanceOf(address(this));
        }
        _mint(msg.sender, shares);
        token.transferFrom(msg.sender, address(this), _amount);
    }

    function withdraw(uint _shares) external {
        uint amount = (_shares * token.balanceOf(address(this))) / totalSupply;
        _burn(msg.sender, _shares);
        token.transfer(msg.sender, amount);
    }

}