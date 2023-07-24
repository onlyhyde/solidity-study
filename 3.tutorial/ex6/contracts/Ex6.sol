// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract PureView {
  uint8 private data = 255;

  function getData() public view returns(uint8) { // state값을 조회하는 경우
    return data;
  }

  function getPureData() public pure returns(uint8) { // state값을 조회 하지 않은 경우
    uint8 tempData = 1;
    return tempData;
  }

  // Storage : 영구적 저장 
  // memory : 일시적 생성 
  uint8 private sdata = 255; // storage

  function getStorageData() public view returns(uint8) { // state값을 조회하는 경우
    return sdata;
  }

  function getMemoryData() public pure returns(uint8) { // state값을 조회 하지 않은 경우
    uint8 tempData = 1;
    return tempData;
  }

  // memory 값을 읽을때는 pure를 사용, storage 값을 읽을때는 view를 사용.
}