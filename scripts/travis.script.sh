#!/bin/bash

docker exec ${CONTAINER_NAME} /bin/bash ./scripts/build.sh
docker exec ${CONTAINER_NAME} /bin/bash ./scripts/run-tests.sh