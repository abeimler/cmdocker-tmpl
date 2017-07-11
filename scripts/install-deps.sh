#!/bin/bash

### @NOTE: (binary-libs) dependencies install script

#apt-get -qq update && apt-get install -qq -y \
#    binutils-dev \
#    libboost-all-dev \
# && rm -rf /var/lib/apt/lists/*


apt-get -qq update && apt-get install -qq -y \
    libgtest-dev \
    libunittest++-dev \
    libicu-dev \
    libboost-serialization-dev \
    libssl-dev libboost-system-dev libboost-iostreams-dev \
    libboost-test-dev \
 && rm -rf /var/lib/apt/lists/*


## for cpp-coveralls
apt-get -qq update && apt-get install -qq -y \
	python \
    python-pip \
 && rm -rf /var/lib/apt/lists/*

pip install --user cpp-coveralls
