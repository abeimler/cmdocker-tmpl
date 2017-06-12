#!/bin/bash

cd $SOURCE_PATH

### @NOTE: cmake clean
if [ "$CLEAN_BUILD" = "1" ]; then cmake --build $BUILD_PATH --target clean --config $BUILD_CONFIG; fi

### @NOTE: cmake build
cmake --build $BUILD_PATH --target all --config $BUILD_CONFIG -- -j2

exit $?