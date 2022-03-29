# Contracts

# Brownie setup

## Build container

`docker build -t brownie .`

## In project folder, run container

`docker run -it -v $(pwd):/app brownie bash `

## Inside a container, import account for deploy
`brownie accounts import default-dev acc.json` Password is empty string
## OR add new account from seed
`brownie accounts new default-dev` 
* Notice: `default-dev` is just a name for account, you could use any other string.

## Compile contracts
`brownie compile`

## Run some deploy scripts

`brownie run scripts/deploy.py --network waterfall-test`


# Deploy new pool

### Create contract sources
* copy contract sources from 3pool-test to new folder
* configure pool by editing pooldata.json
* change first rates in `StableSwap3Pooltest.vy:83`. Also, you can change number of pool coins there.

### Edit deploy script
* change name of contract path
* also, you can change account used for deploy
* If you changed the authorization account in the _tx_params object, change the parameter from, to the address of the new account
* You also need to change the provider, to the provider of the current network here: `web3 = Web3(Web3.HTTPProvider('https://rpc.waterfall.network/rpc'))`