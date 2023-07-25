// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    uint8 private _decimals = 6;

    constructor() ERC20("MyToken", "TTT") {
        _mint(msg.sender, 100000 * 10 ** decimals());
    }

    function decimals() public view override  returns (uint8) {
        return _decimals;
    }
}