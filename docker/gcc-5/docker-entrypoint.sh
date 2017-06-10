#!/bin/bash
set -e

#./scripts/install-deps.sh


if [ -f "/toolchain.cmake" ]
then
    CMAKE_OPTIONS="$CMAKE_OPTIONS -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/toolchain.cmake"
fi
CMAKE_OPTIONS="$CMAKE_OPTIONS -DCMAKE_INSTALL_PREFIX:PATH=/prefix"

./scripts/prebuild.sh
./scripts/build.sh
./scripts/run-tests.sh

#exec "$@"
