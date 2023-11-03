// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract ImplementV1 {
    address public implementation;
    uint public x;
    uint public y;

    function inc() external {
        x += 1;
    }

    function dec() external {
        x -= 1;
    }
}