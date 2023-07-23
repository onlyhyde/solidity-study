//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Contract에서 주소를 전달받았을때, 그 주소가 EOA인지, Contract 주소인지 확인이 필요한 경우가 있음
// Contract에 코인을 전송했다가 못찾는경우가 발생하기도 함. 
// 전송 전에 주소가 어떤 주소인지 확인하는 경우가 있음.
contract CheckContract {
    function isContract(address _address) public view returns (bool) {
        uint32 size;

        // inline assembly라고 해서, Smart Contract상에서 assembly code를 작성할 수 있음. 
        assembly {
            size := extcodesize(_address) // extcodesize는 해당 주소의 코드 사이즈를 리턴함.
        }
        return (size > 0); // 0보다 크면 Contract 주소임. (CA or EOA)
    }
}