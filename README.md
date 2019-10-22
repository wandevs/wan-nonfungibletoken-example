![Build Status](https://travis-ci.org/0xcert/ethereum-erc721.svg?branch=master)&nbsp;[![NPM Version](https://badge.fury.io/js/@0xcert%2Fethereum-erc721.svg)](https://badge.fury.io/js/0xcert%2Fethereum-erc721)&nbsp;[![Dependencies Status](https://david-dm.org/0xcert/ethereum-erc721.svg)](https://david-dm.org/0xcert/ethereum-erc721)&nbsp;[![Bug Bounty](https://img.shields.io/badge/bounty-open-2930e8.svg)](https://github.com/0xcert/ethereum-erc721/issues/46)

# ERC-721 Token

This is a complete implementation of the [ERC-721](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-721.md) non-fungible token standard for the Wanchain blockchain. This is an open source project build with [Truffle](http://truffleframework.com) framework.

Purpose of this implemetation is to provide a good starting point for anyone who wants to use and develop non-fungible tokens on the Wanchain blockchain. Instead of re-implementing the ERC-721 yourself you can use this code which has gone through multiple audits and we hope it will be extensively used by the community in the future.

## Installation

Setup:
- Windows, Linux or Mac OS X
- Wallet account with a sufficient balance

This example was implemented using Truffle v4.1.7 and Solidity v0.4.23.

Simply clone the repository and install npm packages:

```
$ git clone https://github.com/wandevs/wan-nonfungibletoken-example.git
$ cd ethereum-erc721
$ npm install
```

Make sure that everything has been set up correctly:

```
$ npm run test
```

All tests should pass.

## Structure

Since this is a Truffle project, you will find all tokens in `contracts/tokens/` directory. There are multiple implementations and you can select between:
- `NFToken.sol`: This is the base ERC-721 token implementation (with the support for ERC-165).
- `NFTokenEnumerable.sol`: This implements optional ERC-721 support for enumeration. It is useful if you want to know the total supply of tokens, to query a token by index, etc.
- `NFTokenMetadata.sol`: This implements optional ERC-721 meta-data features for the token contract. It implements a token name, a symbol and a distinct URI pointing to a publicly exposed ERC-721 JSON metadata file.

Other files in the directory starting with `ERC*.sol` are interfaces and define the respective standards.

## Deploying on testnet

Next step is to deploy the contract on the testnet.

**NOTE**: For each indication of `"<WALLET ADDRESS>"`, please fill in your own wallet address. Each account address will be different! And don't forget the passphrase otherwise you won't be able to unlock your new account.

Sync your client with the testnet

```
$ go-wanchain/build/bin/gwan --testnet --rpc --rpcapi=eth,net,wan,web3,personal --etherbase "<WALLET ADDRESS>" --unlock "<WALLET ADDRESS>" --password pwd.txt --mine --minerthreads=1 --wanstats XYZ:admin@<WANSTATS ADDRESS>
```

Open project's `truffle.js` and edit the following items:

```
const ownerAddress = "<WALLET ADDRESS>"
const ownerPassword = "<WALLET PASSWORD>"
```

Next, let's unlock your account:

```
$ truffle console
```

```
truffle(development)> web3.eth.personal.unlockAccount(“<WALLET ADDRESS>”, “<PASSWORD>”, “<LENGTH OF TIME>”)
```
If you are using an older version of web3, do not include the “.eth” in the unlock command.

Finally, return to the normal shell and deploy the contract:

```
$ truffle migrate
```

You can now interact with the contract. First, get the address of the deployed contract and save this information:

```
$ npm run networks
```

In the Truffle console, you can interact with the contract:

```
> const { abi } = require('./build/contracts/FarwestNFToken.json');
> const account0 = “<ACCOUNT ADDRESS>”; // your unlocked account
> const MyNFTokenContract = new web3.eth.Contract(abi, “<CONTRACT ADDRESS>”);
> MyNFTokenInstance.methods.symbol().call();
```

## License

See [LICENSE](./LICENSE) for details.
