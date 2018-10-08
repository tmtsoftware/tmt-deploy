#!/usr/bin/env bash

mkdir -p target/"$1"/bin

./coursier bootstrap -r jitpack com.github.tmtsoftware.csw:csw-cluster-seed_2.12:"$1" -M csw.clusterseed.Main -o target/"$1"/bin/csw-cluster-seed
./coursier bootstrap -r jitpack com.github.tmtsoftware.csw:csw-location-agent_2.12:"$1" -M csw.location.agent.Main -o target/"$1"/bin/csw-location-agent
./coursier bootstrap -r jitpack com.github.tmtsoftware.csw:csw-config-server_2.12:"$1" -M csw.config.server.Main -o target/"$1"/bin/csw-config-server

cp -r ./conf ./target/"$1"
cp ./scripts/csw-services.sh ./target/"$1"/bin
cp ./scripts/redis-sentinel-prod.sh ./target/"$1"/bin