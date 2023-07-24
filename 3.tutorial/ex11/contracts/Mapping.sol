// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Reference 자료형 : value 자료형 type을 확장적으로 사용할 수 있게 해줌.
contract Mapping {
  // ERC20 잔액
  mapping(address => uint) public balance;
  // key -> input value
  // key 값이 중복발생 하지 x 

  // 주소를 key값으로 사용
  function setBalance(address to, uint amount) public {
    // key값에 해당하는 input value에 새로운 값을 대입하는 방식
    //balance["0xdC3BaB6B6aF0773a1bf2038fDc716dcD0bDbd564"]=uint(1000);
    //balance["0xdC3BaB6B6aF0773a1bf2038fDc716dcD0bDbd564"] = 10;
    balance[to] = amount;
  }
  
  function getBalance(address from) public view returns(uint) {
    // uint public myBalance = balance["0xdC3BaB6B6aF0773a1bf2038fDc716dcD0bDbd564"]; // 1000
    return balance[from];
  }

  uint public myBalance;
  function getMyBalance(address from) public {
    myBalance = balance[from]; // 10
  }
}
