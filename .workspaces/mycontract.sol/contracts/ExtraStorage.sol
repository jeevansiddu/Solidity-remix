//SPDX-License-Identifier: MIT
pragma solidity 0.8.8;
import "./SimpleStorage.sol";
contract ExtraStorage is SimpleStorage{
    // add additional functions on this contract
    // overriding - virtual and override keyword
    function store(uint256 _f) public override {
        f=(_f+10);
    }
}