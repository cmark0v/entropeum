run from the root directory of the repo 


 - ``init.sh`` does the submodules for the repo and gets the docker image(s), 
 - the can run:
 - ``build.sh`` - just builds, 
 - ``test.sh`` - run tests with containerized foundry and RPC as declated
 - ``test_local.sh`` - runs tests expecting working foundation rpc at localhost 8545




example .env put it in the root directory:
```
RPC=https://mainnet.infura.io/v3/xxxxxxxxxxxxxxxxxxxxxxxxxx
```
