// SPDX-License-Identifier: MIT License
pragma solidity >= 0.8.0 < 0.9.0;

contract Counter {
  uint public count;

  function getCount() external view returns(uint) {
    return count;
  }

  function inc() external {
    count += 1;
  }

}

interface ICounter{
  function getCount() external view returns(uint);
  function inc() external;
}

contract MyContract {
  function incrementCount(address _counter) external {
    ICounter(_counter).inc();
  }
  function getCount(address _counter) external view returns(uint){
    return ICounter(_counter).getCount();
  }
}

