// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Modifier{
  // transaction 실행에 앞서 조건체크를 위해 사용. 

  uint public minPrice = 1000;
  mapping (address=> uint) public oerderList;
  function test1() public payable {
    require(msg.value > minPrice); // 이 조건이 성립되어야 다음 실행
    oerderList[msg.sender] = msg.value;
  }

  function test2() public payable {
    require(msg.value > minPrice); // 이 조건이 성립되어야 다음 실행
    oerderList[msg.sender] = msg.value;
  }

  // require 조건을 반복하는 것을 Modifier로 간단하게 줄일수 있음.

  modifier checkMinPrice() {
    require(msg.value > minPrice);
    _; // 위 조건 체크후 나오는 다음 함수내용을 실행하겟다는 의미.
  }

  function test3() public payable checkMinPrice{ // Modifier 키워드를 사용하여 중복구문 제거
    oerderList[msg.sender] = msg.value;
  }
}