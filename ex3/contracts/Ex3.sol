// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Operation {
  uint public intData;
  string public stringData;

  function math() public {
    intData = intData + 1;
    intData += 1;
    intData++;

    intData = intData - 1;
    intData = intData * 1;
    intData = intData / 1;
  }

  function weiToEth() public { // wei 는 최소 단위
    uint weiData = 1 wei;

    uint ethData = weiData * (10**18);
    // Solidity에서 1Eth는 아래와 같이 사용해야 한다.
    // 1000000000000000000
    // 1 ether;
    // front에서는 다음과 같이 변환해서 사용
    // 1000000000000000000 / (10**18) = 1 ETH

    uint gweiData = weiData * (10**9);
  }

  function logical() public {
    bool trueData = true;
    bool falseData = false;

    if(trueData) {
      // 
    } else {
      // 
    }

    if(trueData && falseData) // false
    if(trueData || falseData) // true
    if(trueData == falseData) // false
  }

  function logical2() public {
    bool bigData = 100;
    bool smallData = 1;

    if(bigData == smallData) // false
    if(bigData > smallData) // true
    if(bigData != smallData) // true
  }
}