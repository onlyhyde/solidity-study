// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TmpNFT is ERC721, Ownable {
  constructor() ERC721("TmpNFT", "TNFT") {
    for(int i=0; i < 10; i++) {
      _safeMint(msg.sender, uint256(i + 1));
    }
  }

  function safeMint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId);
    }
}