#!/bin/sh
set -ex

## Build and install ODB compiler for linux from src
wget http://www.codesynthesis.com/download/odb/2.3/odb-2.3.0.tar.bz2
tar -xjvf odb-2.3.0.tar.bz2
cd odb-2.3.0 && ./configure && make
sudo make install
