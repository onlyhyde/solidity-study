// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Function {
  uint8 private data = 255;

  function setData(uint8 newData) public {
    data = newData;
  }

  function getData() public view returns(uint8) { // returns 의 type을 명시해야 함.
    return data;
  }
  // 상태를 바꾸지 않는 함수호출은 transaction을 생성하지 않는다.
}