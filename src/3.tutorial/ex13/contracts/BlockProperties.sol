// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

// Remix에서 정상동작하지 않아, 테스트넷에 배포하여 확인
// https://sepolia.etherscan.io/address/0x08452236fe895d115939dc6b6eddcda709c456c7#readContract

contract BlockProperty {
  // https://docs.soliditylang.org/en/v0.8.18/units-and-global-variables.html#block-and-transaction-properties
  uint public block1 = block.basefee;
  uint public block2 = block.chainid;
  address public block3 = block.coinbase;
  uint public block4 = block.difficulty;
  uint public block5 = block.gaslimit;
  uint public block6 = block.number;
  uint public block7 = block.timestamp;


  // Random값 생성시 BlockProperty를 많이 사용.
  // block이 새로 갱신되어야, 새로운 값이 생성됨.
  function generateRandom() public view returns(uint8){
      // keccak256 : SHA-3계열 SmartContract에 내장된 hash 알고리즘.
      // keccak256에는 스트링값이 아닌 byte값으로 인풋을 넣어줘야함. -> abi.encodePacked
      // block의 시간값과, 난이도값을 Random 값 생성에 이용.
      // uint256은 매우 큰 수 이므로, 값을 축소 250이하로
      uint8 number = uint8(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty)))%251);
      return number;
  }
}