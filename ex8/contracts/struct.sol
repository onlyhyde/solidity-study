// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Reference 자료형 : value 자료형 type을 확장적으로 사용할 수 있게 해줌.
contract Struct {
  // struct 안에 value 자료형 type을 
  struct Product {
    string name;
    uint price;
  }

  Product public mainProduct;

  // contract deploy 시에 초기값을 설정하기 위해 사용하는 함수. 
  // deploy 시 한번만 호출되며, 그 뒤에는 따로 호출할 수 없음. 

  uint public maxProductCount;
  constructor() {
    maxProductCount=1000;
  }

  // struct 사용 1
  function initProduct() public {
    Product memory firstProduct;
    firstProduct = Product("toy1", 10);
    mainProduct = firstProduct;
  }

  // struct 사용 2
  function setMainProduct(string memory _name, uint _price) public {
    mainProduct.name = _name;
    mainProduct.price = _price;
  }

  // v0.5.0 부터 구조체, 배열 또는 매핑 유형의 모든 변수에 대한 명시적 데이터 위치는 필수. 
  function getMainProduct() public view returns(Product memory) { // returns(Product) -> Error
    return mainProduct;
  }

  function getMainProductName() public view returns(string memory) { // returns(string) -> Error
    return mainProduct.name;
  }

  function getMainProductPrice() public view returns(uint) {
    return mainProduct.price;
  }
}
