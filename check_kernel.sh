#!/bin/bash

# Check any kernel.
function checkkernel {
    SEARCHSPLOIT=$(searchsploit "Linux Kernel" $1 -e)
    RESULTS=$(echo "$SEARCHSPLOIT" | wc -l)

    echo $(($RESULTS - 5))
}

# Check your current Linux Kernel.
function checkmykernelsecurity {
    # $1: Strict mode?
    if [ "$#" == 0 ] || [ "$1" == '1' ] ; then
	LINUX_VERSION=$(uname -r | awk -F "-" '{print $1 "-" $2 }')
    else
	LINUX_VERSION=$(uname -r | awk -F "-" '{print $1 }')
    fi

    echo $(checkkernel $LINUX_VERSION)
}
