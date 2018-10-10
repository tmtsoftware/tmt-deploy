#!/usr/bin/env bash

if [ "$#" -ne 0 ]
then
mkdir -p target/csw/"$1"/bin

./coursier bootstrap -r jitpack com.github.tmtsoftware.csw:csw-location_2.12:"$1" -M csw.location.Main -o target/csw/"$1"/bin/csw-location
./coursier bootstrap -r jitpack com.github.tmtsoftware.csw:csw-location-agent_2.12:"$1" -M csw.location.agent.Main -o target/csw/"$1"/bin/csw-location-agent
./coursier bootstrap -r jitpack com.github.tmtsoftware.csw:csw-config-server_2.12:"$1" -M csw.config.server.Main -o target/csw/"$1"/bin/csw-config-server

cp -r ./conf ./target/csw/"$1"
cp ./csw-services.sh ./target/csw/"$1"/bin
cp ./scripts/redis-sentinel-prod.sh ./target/csw/"$1"/bin
else
echo "[ERROR] Please provide version ID as argument for creating the artifacts"
fi