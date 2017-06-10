#!/bin/bash

mkdir -p $BUILD_PATH
cd $BUILD_PATH
cmake -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DCMAKE_C_COMPILER=$CC -DCMAKE_CXX_COMPILER=$CXX -DCMAKE_EXPORT_COMPILE_COMMANDS=ON $CMAKE_OPTIONS $SOURCE_PATH

exit 0