# Foundry Initialization Test

This project demonstrates the difference between deploying a contract with constructor initialization versus post-deployment initialization using Foundry.

## Setup

1. Copy the example environment file:

   ```
   cp .env.example .env
   ```

2. Update `.env` with your private key and RPC URL:
   ```
   PRIVATE_KEY=your_private_key_here
   SEPOLIA_RPC_URL=your_sepolia_rpc_url
   ```

3. Run:
   ```
   source .env
   ```

## Testing Initialization Approaches

### Approach 1: Constructor Initialization (1 Transaction)

Deploy the contract with constructor-based initialization:

```bash
forge script script/DeployWithConstructor.s.sol:DeployWithConstructor --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify -vvvv
```

This approach uses only 1 transaction since the initialization happens in the constructor during deployment.

### Approach 2: Post-Deployment Initialization (2 Transactions in a Single Broadcast)

Deploy and then initialize the contract:

```bash
forge script script/DeployWithInitialize.s.sol:DeployWithInitialize --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify -vvvv
```

This script uses Foundry's broadcast mechanism, which may group transactions. To understand how many transactions are happening, check the logs in the console.

### Approach 3: Explicit Separate Transactions

Deploy and initialize with clearly separate transactions:

```bash
forge script script/DeployThenInitialize.s.sol:DeployThenInitialize --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify -vvvv
```

This approach explicitly separates deployment and initialization into different transactions.
