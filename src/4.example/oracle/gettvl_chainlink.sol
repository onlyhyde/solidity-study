// SPDX-License-Identifier: MIT License
pragma solidity >=0.8.0 <0.9.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract TvlCalculator {
    AggregatorV3Interface internal priceFeed;
    event Receive(address sender, uint value);

    constructor() {
        priceFeed = AggregatorV3Interface(
            0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        );
    }

    function getDecimals() external view returns (uint8) {
        uint8 dec = priceFeed.decimals();
        return dec;
    }

    function getDescription() external view returns (string memory) {
        string memory des = priceFeed.description();
        return des;
    }

    function getLatestPrice() internal view returns (int) {
        (
            uint80 roundId,
            int256 price,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        return price;
    }

    function getTvlOnContract() public view returns (uint) {
        int currentPrice = getLatestPrice();
        uint tvl = address(this).balance *
            (uint(currentPrice) / (10 ** priceFeed.decimals()));
        // uint tvl = IERC20(_address).balanceOf("msg.sender") * (uint(currentPrice)/(10**priceFeed.decimals()));
        return tvl;
    }

    fallback() external payable {
        emit Receive(msg.sender, msg.value);
    }

    receive() external payable {
        emit Receive(msg.sender, msg.value);
    }
}
