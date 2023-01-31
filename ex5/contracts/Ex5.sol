// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FunctionVisibility {

  uint8 private data = 255;
  uint8 public data = 255;

  // 외부 공개 x, 상속된 ca x, 내부에서 o
  function setData(uint8 newData) private {
    data = newData;
  }

  // 외부 공개 x, 상속된 ca o, 내부에서 o
  function setData(uint8 newData) internal {
    data = newData;
  }

  // 외부 공개 o, 상속된 ca o, 내부에서 o
  function setData(uint8 newData) public {
    data = newData;
  }

  // 외부 공개 o, 상속된 ca x, 내부에서 x
  function setData(uint8 newData) external {
    data = newData;
  }
}