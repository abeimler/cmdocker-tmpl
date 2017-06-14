#!/bin/bash

## alt
cd $BUILD_PATH
if [ "${RUN_TESTS}" = "1" ]; then ctest -j2 -C $BUILD_CONFIG -T test --output-on-failure; fi

### @NOTE: ctest
#cd /
#ctest -S $SOURCE_PATH/build.cmake
