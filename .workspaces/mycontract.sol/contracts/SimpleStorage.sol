//SPDX-License-Identifier: MIT
pragma solidity 0.8.8;  // version of pragma ^ ->this means any version of 0.8.7 or above is ok
// // pragma solidity >=0.8.7 <0.9.0 more than .7 and less than 9
contract SimpleStorage{
    // types=bool,address,uint,int
    uint f;
    mapping(uint256=>string) public rolltoname;
    student public s1=student({roll:109,name:"jeevan",dept:"cse"});
    struct student{
        uint256 roll;
        string name;
        string dept;
    }
    student[] public p;
    function addstudent(uint _roll,string memory _name,string memory _dept) public{
       // student memory p1=student({roll:_roll,name:_name,dept:_dept});
        p.push(student(_roll,_name,_dept));
        rolltoname[_roll]=_name;
    }

    //bool k=true;
    //bytes32 a="cat";
    function store(uint256 _favorite) public virtual{
        f=_favorite;
    }
    function retrieve() public view returns(uint){
        return f;
    }
    function add() public pure returns(uint){
        return (10*20);
    }
    //0xd9145CCE52D386f254917e481eB44e9943F39138
}