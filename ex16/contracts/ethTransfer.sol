//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract EthTransfer {
    event Transfer();
    event TransferWithData(bytes _data);

    // transfer, send, call
    // address(to).transfer, address(to).send, address(to).call

    function sendTransfer(address payable to) public payable {
        to.transfer(msg.value);
    }

    // send와 transfer의 차이는 send는 실행결과를 return해줌.
    function sendSend(address payable to) public payable {
        bool result = to.send(msg.value);
        if (result == true) {
            // 성공
            emit Transfer();
        } else {
            // 실패
            revert();
        }
    }

    // call 은 외부함수를 호출할수도있고, 이더리움을 전송할수도 있음.
    function call(address payable to) public payable {
        (bool result, bytes memory data) = to.call{value: msg.value}("");
        if (result == true) {
            // 성공
            emit TransferWithData(data);
        } else {
            // 실패
            revert();
        }
    }
}