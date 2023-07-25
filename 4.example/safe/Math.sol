// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Math {
    using SafeMath for uint256;

    uint public a = 5;
    uint public b = 5;
    uint public c = 7;
    uint public d = 0;

    function add() public view returns(uint) {
        return a.add(b);
    }

    function sub1() public view returns(uint) {
        return a.sub(b);
    }

    function sub2() public view returns(uint) {
        return a.sub(c);
    }

    function mul() public view returns(uint) {
        return a.mul(b);
    }

    function div() public view returns(uint) {
        return a.div(d);
    }
}
