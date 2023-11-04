// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./IERC721.sol";

// 🏛️ English Auction, also known as an open ascending price auction
// -> is a bidding format where participants openly place increasingly higher bids
// -> the highest bidder wins the auction and pays the final bid amount

contract EnglishAuction {
    event Start();
    event Bid(address indexed sender, uint amount);
    event WithDraw(address indexed bidder, uint amount);
    event End(address winner, uint amount);

    IERC721 public nft;
    uint public nftId;

    address payable public seller;
    uint public endAt;
    bool public started;
    bool public ended;

    address public highestBidder;
    uint public highestBid;
    mapping(address => uint) public bids;

    constructor(address _nft, uint _nftId, uint _startingBid) {
        nft = IERC721(_nft);
        nftId = _nftId;

        seller = payable(msg.sender);
        highestBid = _startingBid;
    }

    function start() external {
        require(!started, "started!");
        require(msg.sender == seller, "Not seller!");

        nft.transferFrom(msg.sender, address(this), nftId);
        started = true;
        endAt = block.timestamp + 7 days;

        emit Start();       
    }

    function bid() external payable {
         require(started, "Not started!");
         require(block.timestamp < endAt, "Ended!");
         require(msg.value > highestBid, "Value < highest");

         if(highestBid != address(0)) {
            bids[highestBidder] += highestBid;
         }

         highestBidder = msg.sender;
         highestBid = msg.value;

         emit Bid(msg.sender, msg.value);
    }

    function withdraw() external {
        uint bal = bids[msg.sender];
        bids[msg.sender] = 0;
        payable(msg.sender).transfer(bal);

        emit WithDraw(msg.sender, bal);
    }   

    function end() external {
        require(started, "Not started!");
        require(block.timestamp >= endAt, "Not ended!");
        require(!ended, "Ended!");

        ended = true;

        if(highestBidder != address(0)) {
            nft.safeTransferFrom(address(this), highestBidder, nftId);
            seller.transfer(highestBid);
        } else {
            nft.safeTransferFrom(address(this), seller, nftId);
        }

        emit End(highestBidder, highestBid);
    }

}