// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "https://github.com/chiru-labs/ERC721A/blob/main/contracts/ERC721A.sol";

contract My721ANFT is ERC721A {
    constructor() ERC721A("My721ANFT", "MNT") {}

    function mint(uint256 quantity) external payable {
        // `_mint`'s second argument now takes in a `quantity`, not a `tokenId`.
        _mint(msg.sender, quantity);
    }
}