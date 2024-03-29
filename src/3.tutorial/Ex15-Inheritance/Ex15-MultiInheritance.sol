//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Seller {
    address private seller;
    string private location;

    constructor(address _seller) {
        seller = _seller;
    }

    function getSeller() public view returns (address) {
        return seller;
    }
}

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

contract Benz is Car("suv", 4, 10000), Seller(0xdC3BaB6B6aF0773a1bf2038fDc716dcD0bDbd564) {
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
