// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// require 구문과 비슷한데, 조건만 체크할 때 사용
contract Assert {
    mapping(address => uint256) private orderList;

    function order() external payable {
        // 조건이 fail인 경우, Error를 발생시키고,
        // Transaction으로 인해 지금 까지 변경된 state를 rollback
        assert(msg.value != 0);
        // require 조건이 참인경우 실행.
        orderList[msg.sender] = msg.value;
    }
}
