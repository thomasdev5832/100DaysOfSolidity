// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

// ⭐ Crowd funding: allows individuals or organizations to raise funds for their projects

contract SimpleCrowdFund {

    address public owner;
    uint256 public goal;
    uint256 public deadline;
    uint256 public raisedAmount;
    bool public fundingClosed;

    constructor(uint256 _goal, uint256 _deadline) {
        owner = msg.sender;
        goal = _goal;
        deadline = block.timestamp + _deadline;
        raisedAmount = 0;
        fundingClosed = false;
    }

    function contribute() public payable {
        require(!fundingClosed, "Funding is closed.");
        require(block.timestamp <= deadline, "Funding deadline has passed.");
        raisedAmount += msg.value;
        if(raisedAmount >= goal) {
            fundingClosed = true;
        }
    }

    function withdraw() public {
        require(fundingClosed, "Funding is still ongoing!");
        require(block.timestamp >= goal, "Funding goal not reached.");
        require(msg.sender == owner, "Only the contract owner can withdraw funds.");
        payable(owner).transfer(address(this).balance);
    }

}