//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Call 함수는 호출한 컨트랙트에서 처리되고 결과를 리턴함. 
// DelegateCall 함수는 호출한 컨트랙트에서 처리되는 것이 아니라, 호출한 컨트랙트의 코드를 호출된 컨트랙트의 코드로 대체하여 처리함.

contract Calculation {
    address public owner;
    uint public value;

    function add(uint a, uint b) external pure returns(uint) {
        return a + b;
    }

    fallback() external payable{
        owner = msg.sender;
        value = msg.value;
    }

    receive() external payable {
        owner = msg.sender;
        value = msg.value;
    }
}

contract DelegateCallFunc {
    address public owner;
    uint public value;

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
        (bool result, bytes memory returnData) = _address.delegatecall(callFuncBytes);
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
        (bool result, bytes memory returnData) = _address.delegatecall(callFuncBytes);
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