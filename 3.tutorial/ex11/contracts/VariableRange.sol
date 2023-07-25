// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Reference 자료형 : value 자료형 type을 확장적으로 사용할 수 있게 해줌.
contract VariableRange {
  uint private data = 10;

  function getData() public view returns(uint) {
    return data;
  }

  function getData2() public pure returns(uint) {
    uint data = 5;
    return data; // 5
  }
  // data의 name이 중복될 경우, memory의 data를 return 한다.
  // 따라서 view 대신 Pure를 사용하는 것과 같음.
  function getData3() public pure returns(uint) {
    uint data = 5;
    return data; // 5
  }
}
