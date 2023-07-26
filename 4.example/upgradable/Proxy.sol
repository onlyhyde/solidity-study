// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Proxy {
    address public implementation; // 연동할 주소 정보
    uint public x;

    function setImplementation(address _implementation) external {
        implementation = _implementation;
    }

    function _delegate(address _implementation) internal {
        assembly {
            calldatacopy(0,0, calldatasize())

            let result := delegatecall(gas(),_implementation,0,calldatasize(),0,0)

            returndatacopy(0,0, returndatasize())
            switch result
            case 0 {
                revert(0,returndatasize())
            }
            default {
                return(0,returndatasize())
            }
        }
    }

    fallback() external payable {
        // TODO :
        // 로직 컨트랙트를 호출할수 있으면 됨
        _delegate(implementation);
    }

    receive() external payable {
        revert();
    }
}