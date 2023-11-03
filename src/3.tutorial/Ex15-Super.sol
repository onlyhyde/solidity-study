//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// 상속 관계에서 function overriding의 경우, 
// 부모의 함수를 호출하고 싶을때 사용
contract Car {
    string private type_;
    uint8 private door;
    uint private price;

    constructor(string memory _type, uint8 _door, uint _price) {
        type_ = _type;
        door = _door;
        price = _price;
    }
    
    function getDoor() public view returns(uint8) {
        return door;
    }

    function getPrice()  public view virtual returns(uint) {
        return price;
    }
}

contract Benz is Car("suv", 4, 10000){
    string private model;
    address private owner;
    uint private premium;

    constructor(string memory _model, uint _premium) {
        model = _model;
        owner = msg.sender;
        premium = _premium;
    }

    function getModel() public view returns(string memory) {
        return model;
    }

    // 부모의 getPrice 대신 동일이름 함수를 재정의
    function getPrice() public view override returns(uint) {
        return premium;
    }
    function getCarPrice() public view returns(uint) {
        return super.getPrice();
    }
}
