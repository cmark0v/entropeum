Entropeum
---------

This is a library that attempts to provide secure entropy to ethereum contracts at runtime by combining multiple non-autonomous independent dynamic quantities of the execution environment with hash functions to provide ergodic sequence for which pre-determination or control is intractable by all involved parties.  A few functions are provided. Smaller size 32bit and 64 random integer generating functions use a simple hash implemented in the contract. Th standard uint256 uses a tad more gas with ethereum's faviorite hash. keccak. For deomstration and gas comparison there is anothr using 256 bit hash in contract. 



- ``script/chsolc.sh`` - change the solc version in relevant files
- ``make init``        - handle submodules and docker images
- ``make test``        - testnet test hevm
- ``make test_rpc``    - mainnet state test
- ``make gas``         - gas report

This is incomplete as it stands in that it has no actual tests on quality 

use .env file or set env var for webrpc url to use mainnet state in tests
```
RPC=https://mainnet.infura.io/v3/xxxxxxxxxxxxxxxxxxxxxxxxxx
```
