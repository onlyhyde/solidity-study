// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// 반복적인 Error문구가 중복사용되므로, 하나로 관리
// contract 밖에서 선언하던, 안에서 하던 상관없음

// error ZeroCheckError();

contract CustomError{
  error ZeroCheckError(string data);

  mapping(address=>uint) private orderList;

  function order() external payable {
    if (msg.value == 0) {
      revert ZeroCheckError("msg.value is lower than minPrice"); // error 발생, State 롤백
    }
    orderList[msg.sender] = msg.value;
  }
}