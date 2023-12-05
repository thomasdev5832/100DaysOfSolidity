// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

import "./IERC20.sol";

/* 

    🧩 Discrete Staking Rewards: rewards accrue continuously over time, discrete staking rewards provide periodic and distinct payouts.
    
    📈 Benefits:
        1. Predictable Payouts
        2. Lower Gas Costs
        3. Improved User Experience
        4. Customization

*/ 

contract DiscreteStakingRewards {

    IERC20 public immutable stakingToken;
    IERC20 public immutable rewardToken;

    mapping(address => uint) public balanceOf;
    uint public totalSuply;

    uint private constant MULTIPLIER = 1e18;
    uint private rewardIndex;
    mapping(address => uint) private rewardIndexOf;
    mapping(address => uint) private earned;

    constructor(address _stakingToken, address _rewardToken) {
        stakingToken = IERC20(_stakingToken);
        rewardToken = IERC20(_rewardToken);
    }

    function updateRewardIndex(uint reward) external {
        rewardToken.transferFrom(msg.sender, address(this), reward);
        rewardIndex += (reward * MULTIPLIER) / totalSuply;
    }

    function _calculateRewards(address account) private view returns (uint) {
        uint shares = balanceOf[account];
        return (shares * (rewardIndex - rewardIndexOf[account])) / MULTIPLIER;
    }

    function calculateRewardsEarned(address account) external view returns (uint) {
        return earned[account] + _calculateRewards(account);
    }

    function _updateRewards(address account) private {
        earned[account] += _calculateRewards(account);
        rewardIndexOf[account] = rewardIndex;
    }

    function stake(uint amount) external {
        _updateRewards(msg.sender);
        balanceOf[msg.sender] += amount;
        totalSuply += amount;
        stakingToken.transferFrom(msg.sender, address(this), amount);
    }

    function unstake(uint amount) external {
        _updateRewards(msg.sender);
        balanceOf[msg.sender] -= amount;
        totalSuply -= amount;
        stakingToken.transfer(msg.sender, amount);
    }

    function claim() external returns (uint) {
        _updateRewards(msg.sender);
        uint reward = earned[msg.sender];
        if(reward > 0) {
            earned[msg.sender] = 0;
            rewardToken.transfer(msg.sender, reward);
        }
        return reward;
    }

}