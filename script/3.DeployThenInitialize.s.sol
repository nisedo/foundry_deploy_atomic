// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/InitializableContract.sol";

contract DeployThenInitialize is Script {
    function run() public {
        // First transaction - deployment only
        vm.startBroadcast();
        
        InitializableContract deployedContract = new InitializableContract("");
        console.log("Contract deployed to:", address(deployedContract));
        
        vm.stopBroadcast();
        
        // Second transaction - initialization only
        vm.startBroadcast();
        
        deployedContract.initialize("Initialized in a clearly separate transaction");
        console.log("Contract initialized in separate transaction");
        console.log("Owner:", deployedContract.owner());
        console.log("Message:", deployedContract.message());
        
        vm.stopBroadcast();
    }
} 