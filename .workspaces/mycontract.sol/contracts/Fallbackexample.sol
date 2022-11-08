
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
contract Fallbackexample{
    uint256 public res;
    address[] public funder;
    receive() external payable{
        res=1;
        funder.push(msg.sender);
    }
    fallback() external payable{
        res=2;
        funder.push(msg.sender);
    }
}