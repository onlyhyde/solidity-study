// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract TransactionProperty {
  // https://solidity-kr.readthedocs.io/ko/latest/units-and-global-variables.html#index-2
  // 실행하고 남은 가스양 체크
  uint public msg1 = gasleft();
  // transaction의 input data
  bytes public msg2 = msg.data;
  // transaction 요청한 주소
  address public msg3 = msg.sender;
  // 호출한 함수의 첫 4byte (함수 식별자) // EIP-165(인터페이스의 구현 여부 체크) https://eips.ethereum.org/EIPS/eip-165
  bytes4 public msg4 = msg.sig;
  // 사용자가 전송한 wei 수
  uint public msg5 = msg.value;

  // msg.value 를 사용하기 위해서는 payable을 선언해야함. 없을시, msg.value 사용하면 에러발생.
  function checkValue() external payable { 
    uint value = msg.value; 
  }
}