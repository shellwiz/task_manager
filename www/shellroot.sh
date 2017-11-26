#!/bin/bash

DIRSCRIPT="$(dirname $(readlink -f "$0"))"

DIRLIB="$DIRSCRIPT/shellib"
RESP_HTML="$DIRLIB/response_html.sh"
RESP_CSS="$DIRLIB/response_css.sh"
RESP_JS="$DIRLIB/response_js.sh"
RESP_PLAIN="$DIRLIB/response_plain.sh"
BUILD_HTML="$DIRLIB/build_html.sh"

DIR_WEB="$DIRSCRIPT/web"
DIR_POST="$DIRSCRIPT/post"
DIR_DATA="$DIRSCRIPT/data"
DIR_EXEC="$DIRSCRIPT/exec"

export RESP_HTML
export BUILD_HTML
export DIR_DATA
export DIR_EXEC

export DIR_WEB
export DIR_POST

F_PATH="$DIR_WEB/$REQUEST_URI"
S_PATH="$DIR_POST/$REQUEST_URI"
if [ "$REQUEST_METHOD" = "GET" ]; then
    if [ "$REQUEST_URI" = "/" ]; then
        "$BUILD_HTML" "$DIR_WEB/index.html" | "$RESP_HTML"
    elif [[ "$F_PATH" = *.css ]]; then
        cat "$F_PATH" | "$RESP_CSS"
    elif [[ "$F_PATH" = *.js ]]; then
        "$BUILD_HTML" "$F_PATH" | "$RESP_JS"
    elif [[ "$F_PATH" = *.sh ]]; then
        "$F_PATH" | "$RESP_PLAIN"
    elif [ -f "$F_PATH" ]; then
        "$BUILD_HTML" "$F_PATH" | "$RESP_HTML"
    elif [ -f "$F_PATH".html ]; then
        "$BUILD_HTML" "$F_PATH".html | "$RESP_HTML"
    else
        echo '<html><h1>PAGE NOT FOUND</h1><br><a>'"$F_PATH"'</a><html>' | "$RESP_HTML"
    fi
elif [ "$REQUEST_METHOD" = POST ]; then
    if [ -f "$S_PATH" ]; then
        "$S_PATH" | "$RESP_PLAIN"
    else
        echo '<html><h1>BAD REQUEST</h1><br><a>'"$S_PATH"'</a><html>' | "$RESP_HTML"
    fi
else
    echo '<html><h1>FUCK YOU</h1><br><a></a><html>' | "$RESP_HTML"
fi
