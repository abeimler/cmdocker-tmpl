#!/bin/bash

### @NOTE: add your dependencies here (for docker)

#apt-get install -qq -y --no-install-recommends binutils-dev
#apt-get install -qq -y --no-install-recommends libboost-all-dev 

apt-get -qq -y --no-install-recommends \
  binutils \
  libgtest-dev \
  libunittest++-dev \
  libicu-dev \
  libboost-serialization-dev \
  libssl-dev libboost-system-dev libboost-iostreams-dev \
  libboost-test-dev 


## for cpp-coveralls
apt-get install -qq -y --no-install-recommends python-pip

pip install --user cpp-coveralls