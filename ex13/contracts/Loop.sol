// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Loop {
  // Solidity Loop
  // For, while, do while 
  function forLoop() public pure returns(uint){
    // 1 ~ 10 까지 sum
    uint8 sum = 0;
    for(uint8 i=1; i < 11; i++) {
      sum += i;
    }
    return sum;
  }

  function whileLoop() public pure returns(uint){
    uint8 sum = 0;
    uint8 i = 1;
    while(i < 11) {
      sum += i;
      i++;
    }
    return sum;
  }

  function dowhileLoop() public pure returns(uint){
    uint sum = 0;
    uint8 i = 1;
    do {
      sum += i;
      i++;
    } while (i < 11);
    return sum;
  }

  function loopBreak() public pure returns(uint){
    uint8 sum=0;
    for(uint8 i=1; i < 11; i++) {
      sum += i;
      if(i > 5) {
        break;
      }
    }
    return sum;
  }

  function loopContinue() public pure returns(uint){
    uint8 sum=0;
    for(uint8 i=1; i < 11; i++) {
      if(i == 10) {
        continue;
      }
      sum += i;
    }
    return sum;
  }
}