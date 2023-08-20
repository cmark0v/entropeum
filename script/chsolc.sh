#!/bin/bash
#change solc in config files for brownie plus all contracts in the contracts folter                                                                                                                                                         
export CFOLDER=src
export FF=`ls $CFOLDER/*.sol|head -n 1`
export SOLC_VERSION=`grep -ow '\\^[0-9]\\.[0-9]\\.[0-9]\{1,2\}' $FF|cut -c 2-`
export CFGFILES=foundry.toml
export CONTRACTS=`find .|grep \\.sol$`
echo $CONTRACTS 
echo $CFGFILES
if [ $1 ]
then
echo "changing solc $SOLC_VERSION changing to $1"
else
    echo "usage: chsolc.sh <solc-version>"
    echo "this script changes the solc version in brownie config and all contacts and libraries in contracts folder appear to be using $SOLC_VERSION.."
fi
export CHK=`echo $1|grep -ow '[0-9]\\.[0-9]\\.[0-9]\{1,2\}'`
if [ $CHK ] 
then
    sed -i "s/$SOLC_VERSION/$CHK/" $CFGFILES
    echo "change cfg files"
    sed -i "s/pragma solidity \\^[0-9]\\.[0-9]\\.[0-9]\{1,2\}/pragma solidity \\^$CHK/" $CONTRACTS
    echo "change contracts"
    export CHKLIB=`cat $CONTRACTS $CFGFILES|grep $CHK|wc -l`
    export _COUNT=`ls $CONTRACTS $CFGFILES|wc -l`
    if [ $CHKLIB.eq.$_COUNT ]
    then
        echo "looks g2g, all files updated $CHKLIB"
    else
        echo "$CHKLIB out of $_COUNT files changes"
    fi
else
    echo "$1 doesnt look right for a version number to me"
fi
export SOLC_VERSION=$1
