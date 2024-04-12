```shell
alias btcli='bitcoin-cli -chain=regtest -rpcuser=user -rpcpassword=pwd'

btcli createwallet local
btcli loadwallet local
btcli -rpcwallet=local  -generate 1  
btcli -rpcwallet=local getbalance

alias btcli='bitcoin-cli -chain=regtest -rpcuser=user -rpcpassword=pwd'
btcli loadwallet local

btcli -rpcwallet=local send '{"bcrt1p78x3ss5dtpcd3wf03s42y3erct5z2wql7e2cxfyq3krxzh7a9pgsp3dw6q": 1000}' 6 economical
btcli -rpcwallet=local send '{"mqYeLybF1uY55NduYWWsgc7sw3R2WiohGS": 1000}' 6 economical
btcli -rpcwallet=local getreceivedbyaddress "mqYeLybF1uY55NduYWWsgc7sw3R2WiohGS"
btcli -rpcwallet=local listunspent

# 1. 构建 OP_RETURN 脚本
OP_RETURN 6a11434d535f4f49443a383838393939363636

# 2. 创建原始交易
bitcoin-cli createrawtransaction '[{"txid":"1b1f94ae29d373c32a69ea1c6d3e7d03bb61cab2008171ae19ff7ba5edec17e0","vout":0}]' '{"data":"434d535f4f49443a30783961303662","2N21PwJM9gxYyUCq7MBqKAJv9cEBGj43sCR":37}'

# 3. 对交易进行签名（可选）
bitcoin-cli signrawtransactionwithwallet <raw-transaction>

# 4. 发送交易
bitcoin-cli sendrawtransaction <signed-transaction> 
btcli createrawtransaction '[{"txid":"4b9825baec2f26ff94d569ef8431d57aec51da15e7a7f92ce433f792a44d0888","vout":0}]' '{"data":"434d535f4f49443a30783961313263","2N21PwJM9gxYyUCq7MBqKAJv9cEBGj43sCR":1}'
btcli createrawtransaction '[{"txid":"c99c5e499ee7518bbd1e79432b06e2b1edb8c48e58a66ea40031a30c2c617c56","vout":0},{"txid":"b03c14daebf875086a0b095a760be0a428d9bfe7aca24d7ce48fb3e90dc4be63","vout":0}]' '{"bcrt1q7jn9pf078rdcjpmc3hm8tekk88cdk6ldk0jj9k":0.00003}'
btcli createrawtransaction '[{"txid":"5107173139e85ba95d039a9d553cd2c283fb280737559ae914ce08ca40ff6eb6","vout":0}]' '{"bcrt1q7jn9pf078rdcjpmc3hm8tekk88cdk6ldk0jj9k":0.00001}'
btcli -rpcwallet=local signrawtransactionwithwallet "020000000188084da492f733e42cf9a7e715da51ec7ad53184ef69d594ff262fecba25984b0000000000fdffffff020000000000000000116a0f434d535f4f49443a3078396131326300e1f5050000000017a914601b9cfc0eda364883d5ca325dfadbc590a015a68700000000"
btcli  -rpcwallet=local sendrawtransaction "0200000000010188084da492f733e42cf9a7e715da51ec7ad53184ef69d594ff262fecba25984b0000000000fdffffff020000000000000000116a0f434d535f4f49443a3078396131326300e1f5050000000017a914601b9cfc0eda364883d5ca325dfadbc590a015a687024730440220260ae5aedc655d45bd5e80e286bffac6ce7b6d7c73ff90a3a73f7c52854aded9022020aede2ac92f3ea165f0506e2005e99d893d6247487f7474429a64a8fa1cdb7801210314758d7849bc82cd1ad2a30477bebcfc19667dc1ef93cdb0a5c1893be886323900000000" 0 
7f8351aa076778427493bb4b81d8459fd5f4ef8002764eb875c8c15670a3e735
#900c12b8c3b3ac025c693efcc3b18a33ad406d10eadc7bcb5507e278a445a6e7
bcrt1q4q05jgpkc46gl4l0u2ga4ek2ssjyejkhufy03y
btcli  -rpcwallet=local getrawchangeaddress
btcli getblockchaininfo
btcli getblockcount
```

```shell
# cron gen
* * * * * bitcoin-cli -regtest -rpcwallet=local -generate 2 >> /home/bitcoin/.bitcoin/cli.log 2>&1
* * * * * /usr/local/bin/docker exec bitcoind_regtest bitcoin-cli -regtest  -rpccookiefile=/home/bitcoin/.bitcoin/regtest/.cookie -rpcwallet=local -generate 2 >> ~/workspace/arano/docker-files/bitcoin/bitcoind-data/cli.log
```