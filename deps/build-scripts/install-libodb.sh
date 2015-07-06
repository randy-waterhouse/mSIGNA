#!/bin/sh
set -ex

## Build and install libodb for linux from src
wget http://www.codesynthesis.com/download/odb/2.3/libodb-2.3.0.tar.bz2
tar -xjvf libodb-2.3.0.tar.bz2
mkdir libodb-linux-build
cd libodb-linux-build && ../libodb-2.3.0/configure && make
sudo make install
