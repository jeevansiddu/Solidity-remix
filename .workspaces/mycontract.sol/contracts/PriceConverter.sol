//SPDX-License-Identifier: MIT
pragma solidity 0.8.8;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter{
    function getprice() public view returns(uint256){
        //address 	0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        //ABI
        // function to convert price of ethereum in terms of usd to the power of 18
        AggregatorV3Interface pricefeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (,int256 price,,,)=pricefeed.latestRoundData();
        return uint256(price * 1e10); 


    }
    function getconversionrate(uint256 ethamount)public view  returns(uint256){
        uint256 ethprice=getprice();
        uint256 ethamountpriceinusd=(ethamount*ethprice)/1e18;
        return ethamountpriceinusd;
    }
}