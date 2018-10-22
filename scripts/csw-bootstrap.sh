#!/usr/bin/env bash

if [ "$#" -ne 0 ]
then
mkdir -p target/csw/"$1"/bin
cp coursier target/csw/"$1"/bin

./coursier bootstrap -r jitpack com.github.tmtsoftware.csw::csw-location-server:"$1" -M csw.location.server.Main -o target/csw/"$1"/bin/csw-location-server
./coursier bootstrap -r jitpack com.github.tmtsoftware.csw::csw-location-agent:"$1" -M csw.location.agent.Main -o target/csw/"$1"/bin/csw-location-agent
./coursier bootstrap -r jitpack com.github.tmtsoftware.csw::csw-config-server:"$1" -M csw.config.server.Main -o target/csw/"$1"/bin/csw-config-server

cp -r ./conf ./target/csw/"$1"
cp ./scripts/csw-services.sh ./target/csw/"$1"/bin
cp ./scripts/redis-sentinel-prod.sh ./target/csw/"$1"/bin
echo "Artifacts successfully generated"
else
echo "[ERROR] Please provide CSW version ID as argument"
fi
