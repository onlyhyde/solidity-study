// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Address {
  //address public failUser=0xdc3bab6b6af0773a1bf2038fdc716dcd0bdbd564; // 소문자만
  address public user=0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; // 정상적인 주소(대소문자 포함)
  // 체크섬이 정상적이지 않은 주소는 Solidity에서 사용할 수 없음.

  // address를 payable로 캐스팅해서 사용.
  // 이더리움을 주고 받는 주소는 payable를 명시해줘야만 smartcontract에서 사용 가능.
  address payable public payable_user = payable(user);

  // Ex, contract가 이더를 전송받아서 다른 유저에게 주는 경우.
  // 함수에도 payable을 붙여줘야 함.
  function setEth() public payable {
    //   user.transfer(1000000000); // Error, user는 address 
      payable_user.transfer(1*10**18); // 정상, payable_user는 address payable 
  }

  // Address type은 .balance를 통해 잔액정보를 알수있음.
  function getBalance() public view returns(uint) {
      return user.balance;
  }
}
