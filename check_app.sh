#!/bin/bash

# Check an app given a name and version.
function checkapp {
    if [ "$#" == 2 ]; then
	SERVICE_NAME=$1
	SERVICE_VERSION=$2

	RESULT=$(searchsploit $SERVICE_NAME $SERVICE_VERSION -e)
    elif [ "$#" == 1 ]; then
	RESULT=$(searchsploit $SERVICE_NAME -e)
    fi

    RESULTS=$(echo "$RESULT" | wc -l)

    echo $(($RESULTS - 5))
}
