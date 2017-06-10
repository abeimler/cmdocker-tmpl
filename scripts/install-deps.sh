#!/bin/bash

### @NOTE: dependencies install script for local use

#apt-get install -qq -y --no-install-recommends binutils-dev
#apt-get install -qq -y --no-install-recommends libboost-all-dev 


apt-get -qq update \
	&& apt-get install -qq -y --no-install-recommends \
    libgtest-dev \
    libunittest++-dev \
    libicu-dev \
    libboost-serialization-dev \
    libssl-dev libboost-system-dev libboost-iostreams-dev \
    libboost-test-dev


## for cpp-coveralls
apt-get -qq update \
	&& apt-get install -qq -y --no-install-recommends \
    python \
    python-pip

pip install --user cpp-coveralls