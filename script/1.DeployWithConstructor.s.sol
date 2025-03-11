// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/InitializableContract.sol";

contract DeployWithConstructor is Script {
    function run() public {
        // Begin broadcasting transactions
        vm.startBroadcast();

        // Deploy with constructor initialization (1 transaction)
        InitializableContract deployedContract = new InitializableContract("Initialized via constructor");
        
        console.log("Contract deployed to:", address(deployedContract));
        console.log("Owner:", deployedContract.owner());
        console.log("Message:", deployedContract.message());

        vm.stopBroadcast();
    }
} 