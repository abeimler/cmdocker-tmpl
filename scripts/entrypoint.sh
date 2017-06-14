#!/bin/bash

echo "configure..."
$SOURCE_PATH/scripts/configure.sh

echo "build ..."
$SOURCE_PATH/scripts/build.sh

if [ "${RUN_TESTS}" = "1" ]; then echo "run tests ..."; fi
if [ "${RUN_TESTS}" = "1" ]; then $SOURCE_PATH/scripts/run-tests.sh; fi
