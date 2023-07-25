//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// 이미 배포된 컨트랙트 호출 방법
contract Calculation {
    event Transfer();

    function add(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    //~0.6 
    // function() external payable {
    //  emit JustFallbackWIthFunds(msg.sender, msg.value,"JustFallback is called");
    // }
    
    
    //0.6~
    // fallback() external { // 함수를 실행하면서 이더를 보낼때, 불려진 함수가 없을 때 작동합니다.
    //   emit JustFallback(msg.sender,"JustFallback is called");
    // }
    // receive() external payable { // 순수하게 이더만  받을때 작동
    //   emit RecevieFallback(msg.sender, msg.value,"RecevieFallback is called");
    // }
    
    //

    // contract에 존재하지 않는 함수가 호출될 경우, fallback 함수가 호출됨.
    fallback() external payable {
        emit Transfer();
    }

    receive() external payable {
        emit Transfer();
    }
}

contract Call {
 function isContract(address _addr) private view returns(bool){
     uint32 size;
     assembly {
         size := extcodesize(_addr)
     }
     if (size > 0) {
         // Contract
         return true;
     } else {
         // EOA
         return false;
     }
 }

 function callFunc(address payable _address, uint _a, uint _b) public returns(bytes memory) {
    // 외부 컨트랙트를 그냥 콜하는 것이 아닌, 함수호출에 대한 bytes를 생성하여 호출.
    bytes memory callFuncBytes = abi.encodeWithSignature("add(uint256,uint256)", _a, _b); // uint가 아닌, uint256을 사용해야함. (uint==uint256)
    if (isContract(_address) == true) {
        (bool result, bytes memory returnData) = _address.call(callFuncBytes);
        if (result == true) {
            return returnData;
        } else {
            revert();
        }
    } else {
        revert();
    }
 }

 function callNotFunc(address payable _address, uint _a, uint _b) public returns(bytes memory) {
    // 외부 컨트랙트를 그냥 콜하는 것이 아닌, 함수호출에 대한 bytes를 생성하여 호출.
    bytes memory callFuncBytes = abi.encodeWithSignature("NotExistFunc(uint256,uint256)", _a, _b); // uint가 아닌, uint256을 사용해야함. (uint==uint256)
    if (isContract(_address) == true) {
        (bool result, bytes memory returnData) = _address.call(callFuncBytes);
        if (result == true) {
            return returnData;
        } else {
            revert();
        }
    } else {
        revert();
    }
 }

 
}