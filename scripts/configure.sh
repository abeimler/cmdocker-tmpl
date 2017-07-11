#!/bin/bash

### extra CMAKE_OPTIONS 
if [ -f "/toolchain.cmake" ]; then CMAKE_OPTIONS="$CMAKE_OPTIONS -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/toolchain.cmake"; fi ## setup toolchain
CMAKE_OPTIONS="$CMAKE_OPTIONS -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX_PATH"                                                ## setup install perfix
CMAKE_OPTIONS="$CMAKE_OPTIONS -DDOCTEST_WITH_TESTS:BOOL=\"0\""                         ## don't need tests from 3rd-party libs, only build (?)
CMAKE_OPTIONS="$CMAKE_OPTIONS -DSKIP_PORTABILITY_TEST:BOOL=\"1\" -DTHREAD_SAFE:BOOL=\"1\" -DJUST_INSTALL_CEREAL:BOOL=\"1\"" 
#@NOTE: add more custom cmake options here

echo "extra CMAKE_OPTIONS=$CMAKE_OPTIONS"


mkdir -p $BUILD_PATH
cd $BUILD_PATH

### cmake configure
cmake -DCMAKE_BUILD_TYPE:STRING=$BUILD_CONFIG -DCMAKE_EXPORT_COMPILE_COMMANDS=ON $CMAKE_OPTIONS $SOURCE_PATH
