// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title InitializableContract
/// @notice A simple contract to demonstrate initialization patterns
/// @dev This contract can be initialized in two ways: via constructor (1 tx) or via initialize method (2 tx)
contract InitializableContract {
    address public owner;
    string public message;
    bool public initialized;

    error AlreadyInitialized();

    /// @notice Constructor initialization (happens in the same transaction as deployment)
    /// @param _message The message to store
    constructor(string memory _message) {
        owner = msg.sender;
        message = _message;
        // No need to set initialized flag as this is constructor initialization
    }

    /// @notice Post-deployment initialization (requires a separate transaction)
    /// @param _message The message to store
    function initialize(string memory _message) external {
        // Prevent double initialization
        if (initialized) revert AlreadyInitialized();
        
        owner = msg.sender;
        message = _message;
        initialized = true;
    }
} 