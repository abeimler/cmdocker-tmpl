#!/bin/bash

cd $BUILD_PATH

### cmake clean
if [ "$CLEAN_BUILD" = "1" ]; then echo "clean build ..."; fi
if [ "$CLEAN_BUILD" = "1" ]; then cmake --build $BUILD_PATH --config $BUILD_CONFIG --target clean; fi

### cmake build
echo "build ...";
cmake --build $BUILD_PATH --config $BUILD_CONFIG --target all -- -j2
