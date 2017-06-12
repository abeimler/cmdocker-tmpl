#!/bin/bash

echo "configure..."
$SOURCE_PATH/scripts/configure.sh

echo "build ..."
$SOURCE_PATH/scripts/build.sh

echo "run tests ..."
$SOURCE_PATH/scripts/run-tests.sh

exit $?