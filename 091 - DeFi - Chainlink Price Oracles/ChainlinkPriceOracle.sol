// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

// import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

import "./AggregatorV3Interface.sol";

// Chainlink Price Oracles: trusted data sources that supply smart contracts with accurate and up-to-date information from the real world.

contract ChainlinkPriceOracle {

    AggregatorV3Interface internal priceFeed;

    constructor() {
        // setting the address of the Chainlink Aggregator responsible for ETH/USD price data.
        priceFeed = AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419);
    }

    // obtaining the latest Ethereum (ETH) to United States Dollar (USD) exchange rate. 
    function getLastestPrice() public view returns (int) {
        (
            uint80 roundID,
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        // for ETH/USD price is scaled up by 10 ** 8
        return price / 1e8;
    }

}