#!/bin/bash

cmake -H. -B$BUILD_PATH -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DCMAKE_C_COMPILER=$CC -DCMAKE_CXX_COMPILER=$CXX -DCMAKE_EXPORT_COMPILE_COMMANDS=ON $CMAKE_OPTIONS 