// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract ERC721 {

    string private _name;
    string private _symbol;

    mapping(uint256 => string) private _tokenInfo;
    mapping(uint256 => address) private _owners;
    mapping(address => uint256) private _balances;
    mapping(uint256 => address) private _tokenApprovals;
    mapping(address => mapping(address => bool)) private _operatorApprovals;

    uint private totalSupply;


    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    // indexed keyword
    // indexed는 event 객체 내에서 사용할 수 있는 키워드로 event를 검색 또는 필터링하는데 사용할 수 있게 만드는 키워드
    // 이벤트 선언 : event numberTracker(uint256 indexed num, string str);
    // 이벤트 발생 : emit numberTracker(1, "hello");
    // <예제 코드>
    // let abi = /* abi from contract */;
    // let eventTest = web3.eth.contract(abi);
    // let eventTestContract = eventTest.at(/* contract address*/);

    // eventTestContract.methods.PushEvent(0, "hello0").send({from: /* contract caller address */});
    // eventTestContract.methods.PushEvent(1, "hello1").send({from: /* contract caller address */});                                   
    // eventTestContract.methods.PushEvent(2, "hello2").send({from: /* contract caller address */});                                   
    // eventTestContract.methods.PushEvent(3, "hello3").send({from: /* contract caller address */});
                                                        
    // let events = eventTestContract.getPastEvents("numberTracker", {filter: {num: [1,2]}});
    // console.log(events);

    // <output>
    // [
    // 	{
    //     	...,
    //         event: "numberTracker2",
    //         ...,
    //         returnValues: {0: '1', 1: 'hello1', num: '1', str: 'hello1'},
    //         ...
    //     },
    //     {
    //         ...,
    //         event: "numberTracker2",
    //         ...,
    //         returnValues: {0: '2', 1: 'hello2', num: '2', str: 'hello2'},
    //         ...
    //     }
    // ]


    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    function balanceOf(address owner) public view returns (uint256 balance) {

    }

    function ownerOf(uint256 tokenId) public view returns (address owner) {

    }

    function name() public view returns (string memory) {

    }

    function symbol() public view returns (string memory) {

    }

    function tokenURI(uint256 tokenId) public view returns (string memory) {

    }

    function getApproved(uint256 tokenId) public view returns (address operator) {

    }

    function isApprovedForAll(address owner, address operator) public view returns (bool) {

    }

    function transferFrom(address from, address to, uint256 tokenId) public {

    }

    function mint(address to, uint256 tokenId, string memory uri) public {
    }

    function burn(uint256 tokenId) public {
    }

    function transfer(address to, uint256 tokenId) public {
    }

    function approve(address to, uint256 tokenId) public {

    }

    function setApprovalForAll(address operator, bool approved) public {

    }
}
