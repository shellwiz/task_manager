#!/usr/bin/env python

import fileinput
import csv
import sys

def to_sh(arr):
    return " ".join(map(lambda r: "'{}'".format(r.replace("'", "'\"'\"'")), arr))

execute = to_sh(sys.argv[1:])

for row in csv.reader(sys.stdin):
    print execute, to_sh(row)
