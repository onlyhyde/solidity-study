// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Fallback{
  uint public data = 0;

  constructor() {
      data = 5;
  }
  function order() external payable {
      data = 9;
  }

  // ERC20 토큰을 전송해야하는데, ETH를 전송하는 실수를 하는 경우가 있음.
  fallback() payable external {
      // 사용자가 존재하지 않는 함수를 호출 할 때, msg.data 비어있지 않는 경우
      revert();
      // Proxy Contract를 사용할때도 사용한다.
  }

  receive() payable external {
      // 사용자가 ETH를 전송할 때, msg.data 비어있을때 
      revert();
  }
}