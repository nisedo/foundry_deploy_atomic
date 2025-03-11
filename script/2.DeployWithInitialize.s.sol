// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/InitializableContract.sol";

contract DeployWithInitialize is Script {
    function run() public {
        // Begin broadcasting transactions
        vm.startBroadcast();

        // Deploy without initialization
        InitializableContract deployedContract = new InitializableContract("");
        
        console.log("Contract deployed to:", address(deployedContract));
        
        // Initialize in a separate call (2nd transaction)
        deployedContract.initialize("Initialized via separate transaction");
        
        console.log("Contract initialized");
        console.log("Owner:", deployedContract.owner());
        console.log("Message:", deployedContract.message());

        vm.stopBroadcast();
    }
} 