//SPDX-License-Identifier: MIT License
pragma solidity ^0.8.9;

interface IUniswapCaller {
    function getPair(address tokenA, address tokenB) external view returns (address pair);
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}

contract UniswapCaller {
    function getPair() public view returns (address) {
        return IUniswapCaller(0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f).getPair(
            0xB4FBF271143F4FBf7B91A5ded31805e42b2208d6,
            0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984
        );
    }

    function getPrice(address pairAddress) public view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast) {
        return IUniswapCaller(pairAddress).getReserves();
    }
}