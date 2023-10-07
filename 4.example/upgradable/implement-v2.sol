// SPDX-License-Identifier: MIT License
pragma solidity >= 0.8.0 < 0.9.0;

contract ImpleV2 {
  address public implementation;
  uint public y;

  function inc() external {
    y += 1;
  }
  function dec() external {
    y -= 1;
  }
}