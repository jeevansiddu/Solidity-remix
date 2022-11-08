//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./SimpleStorage.sol";
contract StorageFactory{
    SimpleStorage[] public simplestorageArray;
    function createsimplestoragecontract() public{
        simplestorageArray.push(new SimpleStorage());
        //SimpleStorage simplestorage=new SimpleStorage();;
        //simplestoragearray.push(simplestorage); another way for creating list of cintractsp 
    }    
    function sfstore(uint256 _simplestorageindex,uint256 _simplestoragevalue) public{
         // Address
         // ABI-application binary interface
         SimpleStorage s1=simplestorageArray[_simplestorageindex];
         s1.store(_simplestoragevalue);

    }
    function sfget(uint256 _simplestorageindex) public view returns(uint256){
        SimpleStorage s1=simplestorageArray[_simplestorageindex];
        uint256 k=s1.retrieve();
        return k;
        // return simplestorageArray[_simplestorageindex].retrieve(); another way of calling function

    }

} 