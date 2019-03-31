#!/bin/sh

wget https://github.com/python/cpython/archive/v3.7.3.tar.gz
tar -xf Python-3.7.3.tgz
cd Python-3.7.3

apt-get install build-essential checkinstall
apt-get install \
    libreadline-gplv2-dev \
    libncursesw5-dev libssl-dev \
    libsqlite3-dev \
    tk-dev \
    libgdbm-dev \
    libc6-dev \
    libbz2-dev
 
./configure --enable-optimizations --enable-shared --with-lto

make -j 8
make altinstall

cd ../
rm -rf Python-3.7.3
