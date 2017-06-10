#!/bin/bash

cd $BUILD_PATH
if [ "${USE_CTEST}" != "1" ] && [ "${BUILD_ONLY}" != "1" ]; then cmake --build $BUILD_PATH --target test; fi
if [ "${USE_CTEST}" != "1" ] && [ "${COVERAGE}" = "1" ]; then bash <(curl -s https://raw.githubusercontent.com/codecov/codecov-bash/master/codecov) -x $GCOV -a "-s `pwd`" ; fi

cd $SOURCE_PATH
if [ "${USE_CTEST}" = "1" ] && [ "${BUILD_ONLY}" != "1" ]; then ctest -S build.cmake; fi