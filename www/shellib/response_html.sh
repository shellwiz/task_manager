#!/bin/bash

echo 'Content-type: text/html'$'\n'

if [ "${1:-none}" = none ]; then
    cat
else
    echo "$@"
fi
