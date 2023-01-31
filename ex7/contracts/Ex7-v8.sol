// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract FunctionV8 {
  uint8 private data = 255; // 0 ~ 255 + 1

  // Overfloew -> 에러 발생
  function setData() public {
    data += 1;
  }

  function getData() public view returns(uint8) {
    return data;
  }
}
