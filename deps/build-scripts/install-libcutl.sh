#!/bin/sh
set -ex

## Build and install libcutl for linux from src
wget http://www.codesynthesis.com/download/libcutl/1.8/libcutl-1.8.0.tar.bz2
tar -xjvf libcutl-1.8.0.tar.bz2
cd libcutl-1.8.0 && ./configure && make
sudo make install
sudo ldconfig
