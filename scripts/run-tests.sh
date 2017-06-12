#!/bin/bash

## alt
cd $BUILD_PATH
if [ "${RUN_TESTS}" = "1" ]; then ctest -j2 -C $BUILD_CONFIG -T test --output-on-failure; fi

### @NOTE: ctest
#cd $SOURCE_PATH
#ctest -S build.cmake
