//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// 상속 관계에서 function overriding의 경우,
// 부모 컨트랙트에는 virtual 키워드를,
// 자식 컨트랙트에는 override 키워드를 추가
contract Car {
    string private type_;
    uint8 private door;
    uint256 private price;

    constructor(string memory _type, uint8 _door, uint256 _price) {
        type_ = _type;
        door = _door;
        price = _price;
    }

    function getDoor() public view returns (uint8) {
        return door;
    }

    function getPrice() public view virtual returns (uint256) {
        return price;
    }
}

contract Benz is Car("suv", 4, 10000) {
    string private model;
    address private owner;
    uint256 private premium;

    constructor(string memory _model, uint256 _premium) {
        model = _model;
        owner = msg.sender;
        premium = _premium;
    }

    function getModel() public view returns (string memory) {
        return model;
    }

    // 부모의 getPrice 대신 동일이름 함수를 재정의
    function getPrice() public view override returns (uint256) {
        return premium;
    }
}
