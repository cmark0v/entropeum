#!/bin/bash
#run from repo root
docker run --network host -v $PWD:/app  foundry "forge test --gas-report -vvv --root /app --watch  "
