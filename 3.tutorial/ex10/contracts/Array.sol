// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Reference 자료형 : value 자료형 type을 확장적으로 사용할 수 있게 해줌.
contract Array {
  // 기본적으로 여러개의 Data를 보관하고 싶을때 사용. 
  // [1,2,3,4]
  int[] public intList = [1,2,3,4]; // 배열의 크기를 알 수 없을때
  int[3] public int3List = [1,2,3]; // 배열의 크기를 알 때 

  // Struct Type도 배열가능
  struct Product {
    string name;
    uint price;
  }

  Product[] public productList;
  // data insert 시, push 함수를 사용

  //[1,2,3,4] -> [1,2,3,4,5]
  intList.push(5);
  // 마지막 저장 값을 꺼낼때,
  int public lastData = intList.pop(); //5
  // 5가 빠졌으니, [1,2,3,4]만 남음
  // 중간의 값을 읽고 싶을때는
  int public secondData = intList[1]; // 2
  // pop으로 꺼낸것이 아니므로, 여전히 [1,2,3,4] 로 존재

  // 중간의 값을 삭제하고 싶은경우
  delete intList[1]; // [1, 0, 3, 4] 가 됨.
}
