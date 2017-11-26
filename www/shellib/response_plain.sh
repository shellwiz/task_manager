#!/bin/bash

echo 'Content-type: text/plain'$'\n'

if [ "${1:-none}" = none ]; then
    cat
else
    echo "$@"
fi
