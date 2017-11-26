#!/bin/bash


"$DIR_DATA"/model.sh get_all_data | "$DIR_EXEC"/csv_to_arg.py "$DIR_EXEC/render_descr.sh" | bash
