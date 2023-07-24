// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Reference 자료형 : value 자료형 type을 확장적으로 사용할 수 있게 해줌.
contract Array {
  // 기본적으로 여러개의 Data를 보관하고 싶을때 사용. 
  // [1,2,3,4]
  int[] public intList = [int(1),2,3,4]; // 배열의 크기를 알 수 없을때
  int[3] public int3List = [int(1),2,3]; // 배열의 크기를 알 때 

  // Struct Type도 배열가능
  struct Product {
    string name;
    uint price;
  }

  Product[] public productList;
  // data insert 시, push 함수를 사용

  //[1,2,3,4] -> [1,2,3,4,5]
  function pushIntegerToList(int _newData) public {
    intList.push(_newData);
  }

  function popIntegerList() public returns(int) {
    // 마지막 저장 값을 꺼낼때,
    require(intList.length > 0, "List is empty");
    int lastData = intList[intList.length - 1];
    intList.pop();
    // 5가 빠졌으니, [1,2,3,4]만 남음
    return lastData;
  }

  function getIntegerListData(uint index) public view returns(int) {
    int listData = intList[index]; // index의 해당 값 리턴
    // pop으로 꺼낸것이 아니므로, 여전히 [1,2,3,4] 로 존재
    return listData;
  }
  
  function deleteIntegerList(uint index) public {
    // 중간의 값을 삭제하고 싶은경우
    delete intList[index]; // [1, 0, 3, 4] 가 됨.
  }
}
