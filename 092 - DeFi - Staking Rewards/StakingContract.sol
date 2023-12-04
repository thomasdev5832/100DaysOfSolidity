// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

contract StakingContract {

    address public staker;
    uint256 public stakedAmount;
    uint public rewards;

    function stake(uint amount) public {
        // lock the user's tokens and record their staked amount
        staker = msg.sender;
        stakedAmount = amount;
        // emit an event to track the staking activity
        emit Staked(msg.sender, amount);
    }

    // other functions for rewards distribution and withdraw

}