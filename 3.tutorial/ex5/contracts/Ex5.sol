// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FunctionVisibility {

  uint8 private privateData = 255;
  uint8 public publicData = 255;

  // 외부 공개 x, 상속된 ca x, 내부에서 o
  function setDataPrivate(uint8 newData) private {
    privateData = newData;
  }

  // 외부 공개 x, 상속된 ca o, 내부에서 o
  function setDataInternal(uint8 newData) internal {
    privateData = newData;
  }

  // 외부 공개 o, 상속된 ca o, 내부에서 o
  function setDataPublic(uint8 newData) public {
    publicData = newData;
  }

  // 외부 공개 o, 상속된 ca x, 내부에서 x
  function setDataExternal(uint8 newData) external {
    publicData = newData;
  }
}