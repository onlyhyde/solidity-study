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
  function checkValue() external payable returns(uint){ 
    uint value = msg.value; 
    return value;
  }

  // contract을 호출한 사용자와 전송한 eth의 wei 수를 관리하는 방법
  mapping(address=> uint) private orderList;
  function newOderList() external payable {
      orderList[msg.sender] = msg.value;
      this.newCheckFunction();
  }

  // 함수식별자 확인 방법 (msg.sig)
  bytes4 private checkFunction;
  function newOderList2() external pure returns(bytes4){
      return msg.sig;
  }

  function getSelector(string calldata _func) external pure returns (bytes4) {
      return bytes4(keccak256(bytes(_func)));
  }

  function newCheckFunction() external pure returns(bool) {
      bytes4 selector = bytes4(keccak256(abi.encodePacked("newOderList2()")));
      bool check = false;
      if (selector == msg.sig) {
          return false;
      } else if (msg.sig == 0x1b33b381) { // newCheckFunction() sig
          check = true;
      }
      return check;
  }
}
