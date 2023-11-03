// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "./IERC20.sol";

contract ERC20 is IERC20 {
    uint256 private _totalSupply;

    mapping(address => uint256) private _balance;

    mapping(address => mapping(address => uint256)) private _allowed;

    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address _owner) external view returns (uint256){
        return _balance[_owner];
    }

    function allowance(address owner, address spender)
    external view returns (uint256) {
        return _allowed[owner][spender];
    }

    function approve(address spender, uint256 value)
    external returns (bool) {
        require(spender != address(0));

        _allowed[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transfer(address to, uint256 value) external returns (bool) {
        require(_balance[msg.sender] >= value);
        require(to != address(0));

        _balance[msg.sender] = _balance[msg.sender] - value;
        _balance[to] = _balance[to] + value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value)
    external returns (bool) {
        require(_balance[from] >= value);
        require(_allowed[from][msg.sender] >= value);
        require(to != address(0));

        _balance[from] = _balance[from] - value;
        _balance[to] = _balance[to] + value;
        _allowed[from][msg.sender] = _allowed[from][msg.sender] - value;
        emit Transfer(from, to, value);
        return true;
    }
}