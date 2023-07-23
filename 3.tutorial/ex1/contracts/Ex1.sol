// SPDX-License-Identifier: MIT
// 가장 첫줄은 라이센스 명시

// pragma solidity >=0.8.0 <0.9.0; // solidity version (허용 구간)
pragma solidity ^0.8.17; // solidity version (고정)

// contract code 시작
contract Ex1 {
	// solidity 코드 적용
	// A State를 함수를 통해 B State로 바꾸는 구조
	// A -> Func() -> B
	uint8 public a = 10; // a상태 

	function changeDate() public {
		a = 15; // 상태 변경
	}
}