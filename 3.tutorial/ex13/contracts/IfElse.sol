// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract IfElse {
  uint public minimalPrice = 1000;
  function conditional(uint buyPrice) public view {
    if (buyPrice > minimalPrice) {
      // bid
    } else {
      // fail
      revert(); // 실패했음을 알려줌. 
    }
  }
}