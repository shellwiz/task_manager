#!/bin/bash

DIR_DB="$DIR_DATA/sqlite3/"
PATH_DB="$DIR_DB/list_task.db"
sql() { sqlite3 -csv -batch "$PATH_DB" "$@"; }


function init() {
    mkdir -p "$DIR_DB"

    sql <<EOF
    CREATE TABLE list_task (
        rowid INTEGER PRIMARY KEY ASC,
        owner TEXT,
        header TEXT,
        body TEXT,
        start_date DATE
    );
EOF
}

function esc() {
    # Escape quote
    echo "${1//\'/\'\'}"
}

function insert() {
    local owner=$(esc "$1")
    local header=$(esc "$2")
    local body=$(esc "$3")
    local start_date=$(date  +'%Y/%m/%d')

    sql <<EOF
        insert into list_task
            (owner, header, body, start_date)
        values
            ('$owner', '$header', '$body', '$start_date');

        select last_insert_rowid() ;
EOF
}

function get_all_data() {
    sql <<EOF
    select
        rowid, owner, header, body, start_date 
    from 
        list_task;
EOF
}

function get_row() {
    local id="$1"

    sql <<EOF
    select
        rowid, owner, header, body, start_date 
    from 
        list_task
    where
        rowid='$id';
EOF
}

function update() {
    local id="$(esc "$1")"
    local header="$(esc "$2")"
    local body="$(esc "$3")"

    sql <<EOF
    update list_task
    set
        header='$header', body='$body'
    where
        rowid='$id';
EOF
}

function delete() {
    local id="$1"

    sql <<EOF
    delete from
        list_task
    where
        rowid='$id';
EOF
}



    ########
    # MAIN #
    ########

    if ! [ -f "$PATH_DB" ]; then
        init    
    fi

    cmd="$1"
    shift

    if [ "$cmd" = insert ]; then
        insert "$@"
    elif [ "$cmd" = get_all_data ]; then
        get_all_data "$@"
    elif [ "$cmd" = get_row ]; then
        get_row "$@"
    elif [ "$cmd" = update ]; then
        echo "update $@" &>> "$DIR_DATA"/log
        update "$@"
    elif [ "$cmd" = delete ]; then
        delete "$@"
    fi

