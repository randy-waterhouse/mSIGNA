#!/bin/sh
set -ex

## Build and install libodb-sqlite for linux from src
wget http://www.codesynthesis.com/download/odb/2.3/libodb-sqlite-2.3.0.tar.bz2
tar -xjvf libodb-sqlite-2.3.0.tar.bz2
mkdir libodb-sqlite-linux-build && cd libodb-sqlite-linux-build
../libodb-sqlite-2.3.0/configure && make
sudo make install

