#!/usr/bin/env bash

if [ "$#" == 2 ]
then
mkdir -p target/csw/"$1"/bin
mkdir -p target/esw/"$2"/bin

./coursier bootstrap -r jitpack com.github.tmtsoftware.csw:csw-location_2.12:"$1" -M csw.location.Main -o target/csw/"$1"/bin/csw-location
./coursier bootstrap -r jitpack com.github.tmtsoftware.csw:csw-location-agent_2.12:"$1" -M csw.location.agent.Main -o target/csw/"$1"/bin/csw-location-agent
./coursier bootstrap -r jitpack com.github.tmtsoftware.csw:csw-config-server_2.12:"$1" -M csw.config.server.Main -o target/csw/"$1"/bin/csw-config-server

./coursier bootstrap -r jitpack com.github.tmtsoftware.esw-prototype:ocs-gateway_2.12:"$2" -M ocs.gateway.GatewayApp -o target/esw/"$2"/bin/ocs-gateway
./coursier bootstrap -r jitpack com.github.tmtsoftware.esw-prototype:sequencer-scripts-test_2.12:"$2" -M TestSequencerApp -o target/esw/"$2"/bin/sequencer-app

cp -r ./conf ./target/csw/"$1"
cp ./scripts/csw-services.sh ./target/csw/"$1"/bin
cp ./scripts/redis-sentinel-prod.sh ./target/csw/"$1"/bin
echo "Artifacts successfully generated"
else
echo "[ERROR] Please provide following version IDs for creating the artifacts"
echo "[ERROR] CSW version ID as first argument"
echo "[ERROR] ESW version ID as second argument"
fi