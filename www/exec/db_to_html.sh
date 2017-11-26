#!/bin/bash


"$DIR_DATA"/model.sh get_all_data | "$DIR_EXEC"/csv_to_arg.py "$BUILD_HTML" "$DIR_WEB"/row.html | sed -e 's/&/\\&/g' -e 's/\\\\&/\\\\\\\&/g' | bash 2> /dev/null
