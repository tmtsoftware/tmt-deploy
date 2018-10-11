#!/usr/bin/env bash

if [ "$#" -ne 0 ]
then
mkdir -p target/esw/"$1"/bin

./coursier bootstrap -r jitpack com.github.tmtsoftware.esw-prototype:ocs-gateway_2.12:"$1" -M ocs.gateway.GatewayApp -o target/esw/"$1"/bin/ocs-gateway

echo "Artifacts successfully generated"
else
echo "[ERROR] ESW version ID as argument"
fi
