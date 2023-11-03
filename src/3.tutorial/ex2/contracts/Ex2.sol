// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract DataType {
  // Solidity의 경우 자료형을 반드시 지정해서 사용해야 함.
  // 자료형이 맞지않을경우 처리가 제대로 되지 않거나 에러가 발생. 
  bool public booleanType = true; // true or false
  int public integerType = -10; // 양수 ~ 음수
  uint public unsignedIntegerType = 10; // 양수만
  
  uint256 public unsignedInteger256Type = 10000000000000; // uint와 동일한 Type. 매우 큰 숫자를 처리할때 사용. 0~2^256-1
  int256 public integer256Type = -10000000000000; // -2^255 ~ 2^255-1

  uint8 public unsignedInteger8Type = 100; // 작은 값을 처리할때 사용. 0~2^8-1=255
  int8 public integer8Type = -100; // -2^7 ~ 2^7-1 = -128 ~ 127
  // uint256 - uint8 type을 나누는 이유 : Gas 사용을 효율적으로 처리하기 위해

  string public stringType = "Hello, world"; // string type은 byte로 저장되므로, 아래 처럼 사용 가능.
  bytes public bytesType = "Hello, world"; // bytes는 어떤 길이의 값이 들어올지 알 수 없는 경우, bytes를 사용
  bytes20 public bytes20Type = hex"dc3bab6b6af0773a1bf2038fdc716dcd0bdbd564"; // 고정 길이를 사용하는 경우. 주소값을 쓸때 주로 사용. 
  bytes32 public bytes32Type = hex"781dae1f3a9b7b8b454b7d140632aa072099623d0bbdeae5b67d387e31ba520d"; // tx hash 값을 쓸때 주로 사용.

  // solidity는 소수점 처리를 할 수 없음. float type 존재하지 않는다. 소수점 처리는 외부에서 해결해야 함.
  address public addressType = 0xdC3BaB6B6aF0773a1bf2038fDc716dcD0bDbd564;
}