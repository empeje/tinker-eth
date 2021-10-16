pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
//import "@openzeppelin/contracts/access/Ownable.sol"; //https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract {

  //event SetPurpose(address sender, string purpose);

  string public purpose = "Building Unstoppable Apps!!! - jack";

  mapping(address => uint) public balance;
  address public owner = 0x20B35d6E0C4accf0391FD8fA98bBf63d737fC8AA;


  constructor() {
    // what should we do on deploy?
      balance[owner] = 100;
  }

  function transfer(address to, uint256 amount) public {
      require( amount <= balance[msg.sender], "NOT ENOUGH!!!!");
      balance[msg.sender] -= amount;
      balance[to]+= amount;
  }


  function setPurpose(string memory newPurpose) public payable {
//      require(msg.sender == owner, "NOT OWNER!");

      require(msg.value == 0.01 ether, "NOT OWNER!");

      purpose = newPurpose;
      console.log(msg.sender,"set purpose to",purpose);
      //emit SetPurpose(msg.sender, purpose);
  }
}
