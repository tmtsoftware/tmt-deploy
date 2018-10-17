#!/usr/bin/env bash

if [ "$#" -ne 0 ]
then
mkdir -p target/esw/"$1"/bin

./coursier bootstrap -r jitpack com.github.tmtsoftware.esw-prototype:ocs-gateway_2.12:"$1" -M ocs.gateway.GatewayApp -f -o target/esw/"$1"/bin/ocs-gateway
./coursier bootstrap -r jitpack com.github.tmtsoftware.esw-prototype:ocs-client_2.12:"$1" -M ocs.client.Main -f -o target/esw/"$1"/bin/ocs-client

echo "Artifacts successfully generated"
else
echo "[ERROR] ESW version ID as argument"
fi
