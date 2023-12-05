// SPDX-License-Identifier: MIT License
pragma solidity ^0.8.9;

interface IExchange {
  function ethToTokenSwap(uint256 _minToken) external payable;
  function ethToTokenTransfer(uint256 _minTokens, address _recipient) external payable;
}