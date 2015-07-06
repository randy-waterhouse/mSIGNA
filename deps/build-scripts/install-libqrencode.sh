#!/bin/sh
set -ex

## Build and install libqrencode for linux from src
cd deps/qrencode-3.4.3
./configure && make
sudo make install

