#!/bin/bash

$SOURCE_PATH/scripts/configure.sh

echo -e "\n"

$SOURCE_PATH/scripts/build.sh

if [ "${RUN_TESTS}" = "1" ]; then $SOURCE_PATH/scripts/run-tests.sh; fi
