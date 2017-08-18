#!/bin/bash

# https://stackoverflow.com/questions/29568352/using-docker-compose-with-ci-how-to-deal-with-exit-codes-and-daemonized-linked
# http://blog.ministryofprogramming.com/docker-compose-and-exit-codes/


CONTAINER_NAME=$1

set -e

# Wrap docker-compose and return a non-zero exit code if any containers failed.
exit $(docker-compose ps -q $CONTAINER_NAME | tr -d '[:space:]' | xargs docker inspect -f '{{ .State.ExitCode }}')