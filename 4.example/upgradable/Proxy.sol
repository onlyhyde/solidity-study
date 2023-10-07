// SPDX-License-Identifier: MIT License
pragma solidity >= 0.8.0 < 0.9.0;

contract Proxy {
  address public implementation; // 연동할 주소 정보 (implement contract의 주소)
  uint public x;

  function setImplementation(address _implementation) external {
    implementation = _implementation;
  }

  // proxy contract에 요청을 받은 것을 실제로 처리 하기 위한 함수
  function _delegate(address _implementation) internal {
    assembly {
      calldatacopy(0,0, calldatasize())

      let result := delegatecall(gas(),_implementation,0,calldatasize(),0,0)

      returndatacopy(0,0, returndatasize())
      switch result
      case 0 {
        revert(0,returndatasize())
      }
      default {
        return(0,returndatasize())
      }
    }
  }

  fallback() external payable{
    _delegate(implementation);
  }

  receive() external payable{
    revert();
  }
}