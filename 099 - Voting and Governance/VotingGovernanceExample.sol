// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

contract VotingGovernanceExample {

    // proposal submission
    struct Proposal {
        string description;
        uint256 amount;
        address proposer;
        bool executed;
        uint256 voteCount;
    }

    Proposal[] public proposals;
    uint public proposalCounter;

    function submitProposal(string memory _description, uint256 _amount) public {
        require(_amount > 0, "Amount must be greater than zero.");
        proposals.push(Proposal(_description, _amount, msg.sender, false, 0));
        proposalCounter++;
    }

    // Voting mechanism

    mapping(address => bool) public hasVoted;
    uint256 public totalVotes;

    function vote(uint256 _proposalId, bool _support) public {
        require(_proposalId < proposalCounter, "Invalid proposal ID.");
        require(!hasVoted[msg.sender], "You have already voted!");
        Proposal storage proposal = proposals[_proposalId];
        require(!proposal.executed, "Proposal has already been executed.");

        if(_support) {
            proposal.voteCount++;
        } else {
            proposal.voteCount--;
        }

        hasVoted[msg.sender] = true;
        totalVotes++;
    }

    // Quorum requirements

    uint256 public quorumPercentage = 20; // 20% quorum required

    function setQuorum(uint256 _percentage) public {
        require(_percentage > 0 && _percentage <= 100, "Percentage must be between 1 and 100.");
        quorumPercentage = _percentage;
    }

    function isQuorumMet() public view returns (bool) {
        uint256 totalVoters = totalVotes;
        uint256 minimumVotesRequired = (totalVoters * quorumPercentage) / 100;
        return totalVotes >= minimumVotesRequired;
    }

    // Proposal execution
    
    function executeProposal(uint256 _proposalId) public {
        require(_proposalId < proposalCounter, "Invalid proposal ID.");
        Proposal storage proposal = proposals[_proposalId];
        require(proposal.voteCount > 0, "Proposal has already been executed.");
        proposal.executed = true;

        // implement proposal execution logic here
        // for example: transfer funds
        payable(proposal.proposer).transfer(proposal.amount);
    }

    // Time constraints

    uint256 public proposalDuration = 7 days; // Proposals are open for 7 days

    function setProposalDuration(uint256 _duration) public {
        proposalDuration = _duration;
    }

    function isProposalExpired(uint256 _proposalId) public view returns (bool) {
        require(_proposalId < proposalCounter, "Invalid proposal ID.");
        Proposal storage proposal = proposals[_proposalId];
        return (block.timestamp >= proposal.timestamp + proposalDuration);
    }

}