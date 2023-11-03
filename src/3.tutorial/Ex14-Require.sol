// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Require{
  mapping(address=>uint) private orderList;

  function order() external payable {
    require(msg.value != 0, "Msg.value must not be zero"); // require("조건", 성립하지 않을때 구문)
    orderList[msg.sender] = msg.value; // require 조건이 참인경우 실행. 
  }

  // order1 함수와 동일
  function order2() external payable {
    if (msg.value != 0) {
      orderList[msg.sender] = msg.value;
    } else {
      revert("Msg.value must not be zero");
    }
  }
}