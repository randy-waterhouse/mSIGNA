#!/bin/sh
set -ex

## Need to run that in top level dir and use "sudo ./build-all-deps.sh
## Install binaries from repos for linux

sudo apt-get update -qq
sudo apt-get install -y ssh build-essential libboost-all-dev libssl-dev libsqlite3-dev 
sudo apt-get install -y qtbase5-dev qt5-default gcc-4.8-plugin-dev

## Build/install deps for linux from src

./deps/build-scripts/install-libcutl.sh
./deps/build-scripts/install-odb.sh
./deps/build-scripts/install-libodb.sh
./deps/build-scripts/install-libodb-sqlite.sh
./deps/build-scripts/install-libqrencode.sh
