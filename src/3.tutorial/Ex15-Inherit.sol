//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// 중복되는 기능을 상속하여 사용
// 상속은 is 키워드를 사용
contract Car {
    string private type_;
    uint8 private door;
    
    function getDoor() public view returns(uint8) {
        return door;
    }
}

contract Benz is Car{
    string private model;
    address private owner;

    function getModel() public view returns(string memory) {
        return model;
    }
}

contract Audi is Car{
    string private model;
    address private owner;

    function getModel() public view returns(string memory) {
        return model;
    }
}