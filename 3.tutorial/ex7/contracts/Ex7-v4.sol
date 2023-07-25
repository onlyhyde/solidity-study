// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.5.0;

contract FunctionV4 {
  uint8 private data = 255; // 0 ~ 255 + 1

  // overflow 인데 에러가 발생하지 않음. 
  function setData() public {
    data += 1;
  }

  function getData() public view returns(uint8) {
    return data;
  }
}
