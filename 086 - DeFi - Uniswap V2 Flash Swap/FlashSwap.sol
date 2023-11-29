// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

// 🔄 Flash Swaps 
// 🎩✨ borrows the desired token, executes a sequence of actions (like arbitrage or complex trading strategies), and then pays back the borrowed token along with a fee to the liquidity pool, all within a single transaction. 

contract FlashSwap {

    address public borrower;
    address public tokenToBorrow;
    uint public amountToBorrow;

    function init(address _token, uint _amount) external {
        borrower = msg.sender;
        tokenToBorrow = _token;
        amountToBorrow = _amount;
    }

    function execute() external {
        // custome logic here
        uint fee = amountToBorrow * 0.001; // 0.1% fee
        ERC20(tokenToBorrow).transfer(borrower, amountToBorrow + fee);
    }

}