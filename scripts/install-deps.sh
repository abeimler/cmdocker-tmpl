#!/bin/bash

### @NOTE: add your dependencies here (for docker)

#apt-get install -y binutils-dev
#apt-get install -y libboost-all-dev 

apt-get install -y \
  binutils \
  libgtest-dev \
  libunittest++-dev \
  libicu-dev \
  libboost-serialization-dev \
  libssl-dev libboost-system-dev libboost-iostreams-dev \
  libboost-test-dev 


## for cpp-coveralls
apt-get install -y python-pip

pip install --user cpp-coveralls