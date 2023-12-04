// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

// Aggregator is a trusted external source responsible for fetching and updating price. 
// It provides data such as the latest price, round ID, timestamp, and more.

interface AggregatorV3Interface {
    function latestRoundData()
        external
        view
        returns (
            uint80 roundId,
            int answer,
            uint startedAt,
            uint updatedAt,
            uint80 answeredInRound
        );
}