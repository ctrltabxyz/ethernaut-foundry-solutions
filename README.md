# My Ethernaut Solutions

> **WARNING:** *Do NOT use a wallet containing real funds to interact with this project!*

---

## Getting Started

### Install Foundry

```bash
curl -L https://foundry.paradigm.xyz | bash
```

### Update Foundry

```bash
foundryup
```

---

### (Optional) Install Make

Check if `make` is installed:

```bash
make -v
```

If not, install it:

```bash
sudo apt-get -y install make
```

---

### Install Dependencies

Using `make`:

```bash
make install
```

Or using Foundry directly:

```bash
forge install foundry-rs/forge-std
```

---

### Install a Wallet

Recommended browser wallets:

* [MetaMask](https://chromewebstore.google.com/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn)
* [Rabby Wallet](https://chromewebstore.google.com/detail/rabby-wallet/acmacodkjbdgmoleebolmdjonilkdbch)

---

### Get Sepolia ETH (Testnet)

Use any of the following Sepolia faucets to fund your wallet:

* [Sepolia GCP Faucet](https://cloud.google.com/application/web3/faucet/ethereum/sepolia)
* [Alchemy Faucet](https://alchemy.com/faucets/ethereum-sepolia)
* [Infura Faucet](https://docs.metamask.io/developer-tools/faucet)
* [Chainlink Faucet](https://faucets.chain.link/sepolia)

---

### Create a Cast Wallet

```bash
cast wallet import sepolia --interactive
```

Follow the prompts:

1. Enter your private key.
2. Set and remember your password.

---

### Get an RPC URL

You can get an RPC endpoint from:

* [Tenderly](https://tenderly.co/)
* [Alchemy](https://www.alchemy.com/)
* [Infura](https://www.infura.io/)

---

### Run Solutions on Sepolia

1. Create copy .env_example to .env
2. Specify `RPC_URL` in .env file
3. Visit [Ethernaut](https://ethernaut.openzeppelin.com/)
4. Choose a level and generate a new instance
5. Copy the instance address
6. Update your solution script with the address
7. Execute your solution with:

```bash
forge script script/HelloEthernautSolution.s.sol:HelloEthernautSolution \
  --chain sepolia \
  --rpc-url $RPC_URL \
  --account [your_account_name] \
  --sender [your_wallet_address] \
  --broadcast
```

8. Return to Ethernaut and submit the level

---

### Run Tests Locally with Anvil

```bash
forge test
```

---
