#!/bin/bash

echo 'Content-type: text/css'$'\n'

if [ "${1:-none}" = none ]; then
    cat
else
    echo "$@"
fi
