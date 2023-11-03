// SPDX-License-Identifier: MIT
// 가장 첫줄은 라이센스 명시

// 스마트 콘트랙트에 대한 신뢰는 소스 코드를 사용할 수 있을 때 더 잘 구축될 수 있습니다.
// 소스 코드를 공개하는 것은 항상 저작권과 관련된 법적 문제와 관련이 있기 때문에,
// 솔리디티 컴파일러는 기계 판독이 가능한 SPDX 라이선스 식별자를 사용할 것을 권장합니다.
// 모든 소스 파일은 라이선스를 나타내는 주석으로 시작해야 합니다

// 컴파일러는 해당 라이선스가 SPDX에서 허용하는 목록의 일부인지 확인하지 않지만,
// 제공된 문자열을 바이트코드 메타데이터에 포함시킵니다.
// 바이트코드 메타데이터 : https://docs.soliditylang.org/en/v0.8.20/metadata.html#metadata

// 라이선스를 지정하지 않거나, 소스 코드가 오픈 소스가 아닌 경우 : UNLICENSED를 사용
// 물론 이 코멘트를 제공한다고 해서 각 소스 파일에 특정 라이선스 헤더나 원저작권자를
// 언급해야 하는 등 라이선스와 관련된 다른 의무가 면제되는 것은 아닙니다.

// SPDX 라이선스 식별자 사용 방법에 대한 자세한 내용은 SPDX 웹사이트에서 확인할 수 있습니다.
// 참고 : https://spdx.org/licenses/ 

// pragma solidity >=0.8.0 <0.9.0; // solidity version (허용 구간)
pragma solidity ^0.8.17; // solidity version (고정)

// pragma 키워드는 특정 컴파일러 기능이나 검사를 활성화하는 데 사용됩니다.
// 다른 파일을 가져오면 해당 파일의 프라그마가 가져오는 파일에 자동으로 적용되지 않습니다.

// 버전 프라그마를 사용해도 컴파일러의 버전은 변경되지 않습니다.
// 또한 컴파일러의 기능을 활성화하거나 비활성화하지도 않습니다.
// 단지 컴파일러에 버전이 프라그마에서 요구하는 버전과 일치하는지 확인하도록 지시할 뿐. 
// 일치하지 않으면 컴파일러는 오류를 발생시킵니다.

// 이외에 ABI Coder Pragma 와 Experimental Pragma(ABIEncoderV2, SMTChecker)가 있습니다.

// import 
// import "filename" as symbolName;
// import {symbol} from "filename";
// import * as symbolName from "filename";
// -> symbolName.symbol 의 포맷으로 사용할 수 있습니다. 
// import {symbol1 as alias, symbol2} from "filename"; 
// -> symbol name에 충돌이 있는 경우, 다른 이름으로 alias하여 사용할 수 있습니다. 

// import path
// https://remix-ide.readthedocs.io/en/latest/import.html 

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