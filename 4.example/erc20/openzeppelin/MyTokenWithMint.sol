// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyTokenWihtMint is ERC20, Ownable {
    uint8 private _decimals = 6;

    constructor() ERC20("MyToken", "TTT") {
        mint(msg.sender, 100000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function decimals() public view override  returns (uint8) {
        return _decimals;
    }
}