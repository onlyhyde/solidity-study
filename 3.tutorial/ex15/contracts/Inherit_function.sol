//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Car {
    string private type_;
    uint8 private door;

    constructor(string memory _type, uint8 _door) {
        type_ = _type;
        door = _door;
    }
    
    function getDoor() public view returns(uint8) {
        return door;
    }
}

// 상속하면서 초기값을 지정할수 있음. 
contract Benz is Car("suv", 4){
    string private model;
    address private owner;

    constructor(string memory _model) {
        model = _model;
        owner = msg.sender;
    }

    function getModel() public view returns(string memory) {
        return model;
    }
}
