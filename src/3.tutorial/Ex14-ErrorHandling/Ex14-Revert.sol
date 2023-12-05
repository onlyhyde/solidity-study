// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// require와 다른 점은 조건 체크가 없음
// 조건 체크와 함께 사용됨.
contract Revert {
    mapping(address => uint256) private orderList;
    uint256 public minPrice = 1000;

    function order() external payable {
        if (msg.value < minPrice) {
            // error 발생, State 롤백
            revert("Msg.value must not be zero");
        }
        // require 조건이 참인경우 실행.
        orderList[msg.sender] = msg.value;
    }
}
