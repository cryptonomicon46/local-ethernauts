import { expect } from "chai";
import { ethers } from "hardhat";

let victim: any;
let attacker: any;
let hacker: any;
let deployer: any;
let kingPlayer: any;

describe("Attacking King", function () {
  beforeEach(async () => {
    [hacker, deployer, kingPlayer] = await ethers.getSigners();
    const Victim = await ethers.getContractFactory("King");
    victim = await Victim.connect(deployer).deploy({
      value: ethers.utils.parseEther("1"),
    });
    const Attacker = await ethers.getContractFactory("AttackingKing");
    attacker = await Attacker.connect(hacker).deploy(victim.address, {
      value: ethers.utils.parseEther("5"),
    });
    console.log("\nDeployer Addr:", deployer.address);
    console.log("Attacker Addr", hacker.address)
    console.log("KingPlayer Addr", kingPlayer.address);
    console.log("Attacking contract address:",attacker.address);
    console.log("Victim contract address:",victim.address);
    console.log("\n");

  });

  // Get this to pass!
  it("Succesfully become and remain the king forever", async () => {
    const owner_orig = await victim._king();
    const price_orig = await victim._prize();
    // const Attacker = await ethers.getContractFactory("AttackingKing");

    const balance_orig= await ethers.provider.getBalance(victim.address);
    console.log("Pre Attack\n",owner_orig, ":", price_orig.toString(),balance_orig.toString()); //Deployer and 1 ETH


    await attacker.hackContract({ gasLimit: 30000000 });
    const owner = await victim._king();
    const price = await victim._prize();
    // const Attacker = await ethers.getContractFactory("AttackingKing");

    const balance = await ethers.provider.getBalance(attacker.address);
    console.log("Post Attack\n",owner, ":", price.toString(),balance.toString()); //Deployer and 1 ETH

    try {
      await kingPlayer.sendTransaction({
        value: ethers.utils.parseEther("100"),
        to: victim.address,
        gasLimit: 30000000,
      });
    } catch (error) {
      console.log("error: ", error);
    }
    const king = await victim._king();
    console.log("King post test run", king.toString())
    expect(king).to.not.equal(kingPlayer.address);
  });
});
