---
theme: gaia
_class: lead
paginate: true
backgroundColor: #fff
backgroundImage: url('https://marp.app/assets/hero-background.svg')
marp: true
---

# **Solidity**

---

# Contract Format

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "ERC20.sol";

contract HelloWorld {
    // 행 단위 주석
    /*
       블록 단위 주석
    */
}

```

---

```solidity
// SPDX-License-Identifier: MIT
```

- 모든 소스 파일은 라이선스를 나타내는 주석으로 시작해야 합니다.
- 라이선스를 지정하지 않거나, 소스 코드가 오픈 소스가 아닌 경우 : UNLICENSED를 사용
- 물론 이 코멘트를 제공한다고 해서 각 소스 파일에 특정 라이선스 헤더나 원저작권자를 언급해야 하는 등 라이선스와 관련된 다른 의무가 면제되는 것은 아닙니다.
- SPDX 라이선스 식별자 사용 방법에 대한 자세한 내용은 SPDX 웹사이트에서 확인할 수 있습니다.
  참고 : <https://spdx.org/licenses/>

---

```solidity
pragma solidity ^0.8.19;
```

pragma solidity ^0.8.17; // solidity version (고정)
pragma solidity >=0.8.0 <0.9.0; // solidity version (허용 구간)

| 기호 | 의미                     |
| :--: | ------------------------ |
|  <   | Less than                |
|  <=  | Less than or equal to    |
|  >   | Greater than             |
|  >=  | Greater than or equal to |

---

```solidity
import "ERC20.sol"
```

- import "filename" as symbolName;
- import {symbol} from "filename";
- import \* as symbolName from "filename";
  -> symbolName.symbol 의 포맷으로 사용할 수 있습니다.
- import {symbol1 as alias, symbol2} from "filename";
  -> symbol name에 충돌이 있는 경우, 다른 이름으로 alias하여 사용할 수 있습니다.

- import path
- <https://remix-ide.readthedocs.io/en/latest/import.html>

---

```solidity
contract HelloWorld {
    // solidity 코드 적용
    // A State를 함수를 통해 B State로 바꾸는 구조
    // A -> Func() -> B
    uint8 public a = 10; // a상태
    function changeDate() public {
        a = 15; 상태 변경
    }
}
```

---
