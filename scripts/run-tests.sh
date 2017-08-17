#!/bin/bash

## alt.
cd $BUILD_PATH && ctest -j2 -C $BUILD_CONFIG -T test --output-on-failure

### @NOTE: ctest
#cd /
#ctest -S $SOURCE_PATH/build.cmake
