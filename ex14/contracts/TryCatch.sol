// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// 다른 함수를 호출했을때만 사용가능
contract Math{
  function plusData(uint a, uint b) external returns(uint) {
    return a + b;
  }
}

// 같은 컨트랙트 내부에서 함수 호출시에는 try catch를 사용할 수 없음.
contract TryCatch{
  Math math = new Math();
  address payable tmp_address=0xdC3BaB6B6aF0773a1bf2038fDc716dcD0bDbd564;
  function callOtherContract(address to) external {
    try math.plusData(6,4) returns(uint result) {
      (tmp_address).transfer(result);
    }catch{
      revert();
    }
  }
}