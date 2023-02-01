// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Reference 자료형 : value 자료형 type을 확장적으로 사용할 수 있게 해줌.
contract Enum {
  // 컨트랙트의 진행상태값등을 보고싶을 때 사용 
  // sturct와 동일하게 기본적으로 선언해두고 사용. 
  // struct와 다른점은 변수가 아니라 실제 사용될 데이터 스트링 데이터가 들어감
  enum Status {
    NotSale, // 0
    Auction, // 1
    Sale,    // 2
    Bid,     // 3
    SoldOut  // 4
  }

  Status private auctionStatus;

  function auctionStart() public {
    auctionStatus = Status.Auction;
  }

  function Bid() public {
    auctionStatus = Status.Bid;
  }

  function SoldOut() public {
    auctionStatus = Status.SoldOut;
  }

  function getStatus() public view returns(Status) {
    return auctionStatus;
  }
}
