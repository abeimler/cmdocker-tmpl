#!/bin/bash
set -e

#./scripts/install-deps.sh

## extra CMAKE_OPTIONS
if [ -f "/toolchain.cmake" ]
then
    CMAKE_OPTIONS="$CMAKE_OPTIONS -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/toolchain.cmake"
fi
CMAKE_OPTIONS="$CMAKE_OPTIONS -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX_PATH"

./scripts/prebuild.sh
./scripts/build.sh
./scripts/run-tests.sh

#exec "$@"
