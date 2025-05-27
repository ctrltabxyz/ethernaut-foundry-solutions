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

## Challenges

### Hello Ethernaut

This challenge teaches you to:

* Use MetaMask
* Obtain testnet Sepolia ETH
* Use the browser console
* Interact with smart contracts
* Understand what an ABI is

---

#### Console Solution

Call the following contract methods in sequence (in your browser console):

```js
await contract.info(); // 1
await contract.info1(); // 2
await contract.info2("hello"); // 3
await contract.infoNum(); // 4
await contract.info42(); // 5
await contract.theMethodName(); // 6
await contract.method7123949(); // 7
const password = await contract.password(); // 8
await contract.authenticate(password); // 8
```

### Fallback

This challenge teaches you to:

* How to send ether when interacting with an ABI
* How to send ether outside of the ABI
* Converting to and from wei/ether units
* Fallback methods

---

#### Solution

We need to take control of the contract and withdraw all the ETH.
The `owner` is set in three places:

* the constructor;
* the `contribute` function;
* the `receive` function.

In order for the `owner` to be set via the `contribute` function, we need to contribute more funds than the current owner has — which is 1000 ETH, and that’s too much.

That leaves us with one option to become the owner — the `receive` function.
The vulnerability lies specifically in the `receive` function. To become the owner, we need to send at least 1 wei to the contract. The steps are as follows:

* Call the `contribute` function and send 1 wei to ensure our account appears in the `contributions` map.
* Send 1 wei directly to the smart contract to trigger the `receive` function and become the owner.
* Call the `withdraw` function and drain all ETH from the contract balance.


#### Console Solution

Call the following instructions in sequence (in your browser console):

```js
await contract.contribute({ value: 1 });
await contract.sendTransaction({ to: contract.address, value: 1, });
await contract.withdraw();
```
