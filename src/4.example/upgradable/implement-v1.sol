// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract ImplementV1 {
    address public implementation;
    uint public x;

    function inc() external {
        x += 1;
    }

}