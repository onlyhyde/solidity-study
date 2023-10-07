// SPDX-License-Identifier: MIT License
pragma solidity >= 0.8.0 < 0.9.0;
// Proxy와 동일하게 작성해야 한다.
contract ImpleV1 {
  address public implementation;
  uint public x;

  function inc() external {
    x += 1;
  }
}