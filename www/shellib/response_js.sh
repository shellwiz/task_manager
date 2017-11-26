#!/bin/bash

echo 'Content-type: text/javascript'$'\n'

if [ "${1:-none}" = none ]; then
    cat
else
    echo "$@"
fi
