#!/bin/bash

echo "run tests ...";

cd $BUILD_PATH && ctest -C $BUILD_CONFIG -T test --output-on-failure -j2

### alt.
#cd $BUILD_PATH && ctest -S $SOURCE_PATH/build.cmake
