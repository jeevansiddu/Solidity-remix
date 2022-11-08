// get funds from user store in smart contract
//withdraw funds
// set a miimum funding value
// spl condition that is money can only be withdrawed by person who deployed the contract

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./PriceConverter.sol";
error Notowner();
contract FundMe{
    using PriceConverter for uint256;
    uint256 public fun;
    uint256 public constant MINUSD=20 * 1e18;
    uint256 public f;
    mapping(address=>uint256) public addresstoamtfunded;
    address[] public funders;
    address public immutable i_owner;
    constructor(){
        i_owner=msg.sender;
    }
    function fund() public payable{
       // fun=10; When reverted gas will be used for this line
        require(msg.value.getconversionrate()>=MINUSD,"NEED MORE MONEY"); // to set the value of money we need is more than 1 ether
        funders.push(msg.sender);
        addresstoamtfunded[msg.sender]=msg.value;
       // f=1; gas wont be used when reverted
    }
    function withdraw() public onlyowner{
      //  require(msg.sender==owner,"not the right person");
        for(uint256 i=0;i<funders.length;i++){
            address funder=funders[i];
            addresstoamtfunded[funder]=0;
        }
        funders=new address[](0);


        // transfer
        //payable(msg.sender).transfer(account(this).balance);
        //send
        //bool success=payable(msg.sender).send(account(this).balance);
        //require(success,"not failed");
        //call
        (bool success,bytes memory callreturned)=payable(i_owner).call{value: address(this).balance}("");
        require(success,"Failed"); 
    } 
    receive() external payable{
        fund();
    }
    fallback() external payable{
        fund();
    }


    modifier onlyowner{
       // require(msg.sender==i_owner,"Not the right person");
       if(msg.sender!=i_owner){
           revert Notowner();
       }
        _;
    }
    // function getprice() public view returns(uint256){
    //     //address 	0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
    //     //ABI
    //     // function to convert price of ethereum in terms of usd to the power of 18
    //     AggregatorV3Interface pricefeed= AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
    //     (,int256 price,,,)=pricefeed.latestRoundData();
    //     return uint256(price * 1e10); 


    // }
    // function getconversionrate(uint256 ethamount)public view  returns(uint256){
    //     uint256 ethprice=getprice();
    //     uint256 ethamountpriceinusd=(ethamount*ethprice)/1e18;
    //     return ethamountpriceinusd;
    // }
    // function getdecimals() public view returns(uint256){
    //     AggregatorV3Interface pricefeed=AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
    //     return pricefeed.decimals();
    // }
}