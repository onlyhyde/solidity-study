//SPDX-License-Identifier: MIT License
pragma solidity ^0.8.9;

import "hardhat/console.sol";
import "./Exchange.sol";

contract Factory {
  mapping(address => address) tokenToExchange;

  function createExchange(address _token) public returns (address) {
    Exchange exchange = new Exchange(_token);
    tokenToExchange[_token] = address(exchange);

    return address(exchange);
  }

  function getExchange(address _token) public view returns (address) {
    return tokenToExchange[_token];
  }
}