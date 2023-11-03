// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyERC20 is ERC20 {
    // 1000000000 * 10 ** 18  
    // 1 ETH = 1 * 10 ** 18 (Wei)
    constructor() ERC20("MyERC20Token", "METT") {
        _mint(msg.sender, 10000 * 10 ** decimals());
    }
}