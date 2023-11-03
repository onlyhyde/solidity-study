// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract This {
  // This는 Contract를 지칭한다. 
  function getBalance() public view returns(uint) {
    return address(this).balance; // contract를 address형으로 캐스팅 후, balance를 읽어 Contract의 잔액을 읽수 있음.
  }

  function setBalance() public payable {
    // msg.value 가 전송된 이더를 나타낸다.
  }

  // external은 외부에서만 접근되고, 내부에서는 접근 불가.
  uint public data = 10;
  function externalFunc() external {
    data = 15;
  }

  function internalFunc() internal {
    //externalFunc(); // Error, 내부에서 external 함수 접근 불가.
    this.externalFunc(); // 정상동작. this는 Contract를 나타냄.
  }

  function wrapInternalFunc() public {
    internalFunc();
  }
}
