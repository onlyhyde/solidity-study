// SPDX-License-Identifier: MIT License
pragma solidity >= 0.8.0 < 0.9.0;

contract ERC721 {
  string private _name;
  string private _symbol;

  mapping(uint256 => uint) private _tokenInfo;
  mapping(uint256 => address) private _owners;
  mapping(address => uint256) private _balances;
  mapping(uint256 => address) private _tokenApprovals;
  mapping(address => mapping(address => bool)) private _operatorApprovals;

  uint private totalSupply = 10000;

  event Transfer(address from, address to, uint tokenId);
  event Approval(address from, address to, uint tokenId);
  event ApprovalForAll(address from, address operator, bool approval);
  constructor(string memory __name, string memory __symbol) {
    _name = __name;
    _symbol = __symbol;
  }

  function balanceOf(address __owner) public view returns (uint256) {
    return _balances[__owner];
  }

  function ownerOf(uint256 __tokenId) public view returns (address) {
    return _owners[__tokenId];
  }

  function name() public view returns (string memory) {
    return _name;
  }

  function symbol() public view returns (string memory) {
    return _symbol;
  }

  function tokenURI(uint256 tokenId) public view returns (uint) {
    return _tokenInfo[tokenId];
  }

  function getApproved(uint256 tokenId) public view returns (address) {
    return _tokenApprovals[tokenId];
  }

  function isApprovedForAll(address owner, address operator) public view returns (bool) {
    return _operatorApprovals[owner][operator];
  }

  function transferFrom(
    address from,
    address to,
    uint256 tokenId
  ) public {
    address owner = _owners[tokenId];
    require(msg.sender == owner, "Not Owner");
    require(isApprovedForAll(owner, msg.sender), "Not Approved");
    require(getApproved(tokenId) == msg.sender, "Not Approved");
    delete _tokenApprovals[tokenId];
    _balances[from] -= 1;
    _balances[to] += 1;
    _owners[tokenId] = to;
    emit Transfer(from, to, tokenId);
  }

  function mint(address to, uint256 tokenId) public {
    _balances[to] += 1;
    _owners[tokenId] = to;
    _tokenInfo[tokenId] = randomNft(totalSupply);
    emit Transfer(address(0), to, tokenId);
  }

  // function isExistTokenId(uint tokenId) internal view returns(bool) {
  //   uint256 id = tokenId;
  //   address tokenOwner = _owners[id];
  //   if (tokenOwner == address(0) || (abi.encodePacked(bytes20(tokenOwner)).length != 20)) {
  //     return false;
  //   }
  //   return true;
  // }

  function randomNft(uint maxValue) internal view returns(uint) {
    return uint(keccak256(abi.encodePacked(msg.sender, block.timestamp, totalSupply))) % maxValue;
  }

  function burn(uint256 tokenId) public {
    address owner = _owners[tokenId];
    delete _tokenApprovals[tokenId];
    _balances[owner] -= 1;
    delete _owners[tokenId];
    emit Transfer(owner, address(0), tokenId);
  }

  function transfer(
    address to,
    uint256 tokenId
  ) public {
    require(_owners[tokenId] == msg.sender, "Incorrect Owner");
    delete _tokenApprovals[tokenId];
    _balances[msg.sender] -= 1;
    _balances[to] += 1;
    _owners[tokenId] = to;
    emit Transfer(msg.sender, to, tokenId);
  }

  function approve(address to, uint256 tokenId) public {
    require(msg.sender == _owners[tokenId], "Incorrect Owner");
    _tokenApprovals[tokenId] = to;
    emit Approval(_owners[tokenId], to, tokenId);
  }

  function setApprovalForAll(
    address owner,
    address operator,
    bool approved
  ) public {
    _operatorApprovals[owner][operator] = approved;
    emit ApprovalForAll(owner, operator, approved);
  }
}