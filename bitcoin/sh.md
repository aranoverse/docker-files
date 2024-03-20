```shell
alias btcli='bitcoin-cli -chain=regtest -rpcuser=user -rpcpassword=pwd'

btcli createwallet local
btcli loadwallet local
btcli -generate 1
btcli getbalance
```

```shell
# cron gen
* * * * * bitcoin-cli -regtest -rpcwallet=local -generate 2 >> /home/bitcoin/.bitcoin/cli.log 2>&1
* * * * * /usr/local/bin/docker exec bitcoind_regtest bitcoin-cli -regtest  -rpccookiefile=/home/bitcoin/.bitcoin/regtest/.cookie -rpcwallet=local -generate 2 >> ~/workspace/arano/docker-files/bitcoin/bitcoind-data/cli.log
```