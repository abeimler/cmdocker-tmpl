#!/bin/bash

## extra CMAKE_OPTIONS
if [ -f "/toolchain.cmake" ]; then CMAKE_OPTIONS="$CMAKE_OPTIONS -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/toolchain.cmake"; fi
CMAKE_OPTIONS="$CMAKE_OPTIONS -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX_PATH"

echo "extra CMAKE_OPTIONS=$CMAKE_OPTIONS"


mkdir -p $BUILD_PATH
cd $BUILD_PATH

### @NOTE: cmake configure
cmake -DCMAKE_BUILD_TYPE:STRING=${BUILD_CONFIG} -DCMAKE_EXPORT_COMPILE_COMMANDS=ON $CMAKE_OPTIONS $SOURCE_PATH
