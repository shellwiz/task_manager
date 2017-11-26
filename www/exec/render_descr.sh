#!/bin/bash

rend_descr="$(echo "$4" | pandoc -f markdown | sed -e "s/'/'\"'\"'/g" -e "s/\&/\\\&/g")"

echo "\"$BUILD_HTML\" \"$DIR_WEB/render_row.html\" '$1' '$2' '$3' '$rend_descr' '$5'" | bash 2>/dev/null
