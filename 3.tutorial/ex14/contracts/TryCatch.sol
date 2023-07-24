// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// 다른 함수를 호출했을때만 사용가능
contract Math{
  function plusData(uint a, uint b) external pure returns(uint) {
    return a + b;
  }
}

// 같은 컨트랙트 내부에서 함수 호출시에는 try catch를 사용할 수 없음.
contract TryCatch{
  Math math = new Math();
  address payable tmp_address=payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
  function callOtherContract() external {
    try math.plusData(6,4) returns(uint result) {
      (tmp_address).transfer(result);
    }catch{
      revert();
    }
  }
}