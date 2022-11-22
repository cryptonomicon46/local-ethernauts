import { expect } from "chai";
import { ethers } from "hardhat";

const helper = async (victim: any, attacker: any) => {
  // add code here that will help you pass the test

var side;
var wins;
 var i= 0 ;
 var yourTx;
 while(i<10) {
    await attacker.hackContract();
    i++
 }
};

export default helper;
