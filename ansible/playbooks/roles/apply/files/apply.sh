#!/bin/bash

export VARS_FILE="$(pwd)/vars.sh"
if [ -f "$VARS_FILE" ]; then
    source $VARS_FILE;
fi

docker stack deploy --prune -c docker-compose.yml $DEPLOYMENT_STACK;