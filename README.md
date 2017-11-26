# Task manager

This a light web project for edit and save your task.

# For install

## Docker (Easy way)

~~~
docker build . -t <yourname_image>
docker create -p 80:80 <yourname_image>
docker start <yourname_image>
~~~

## Install a local machine (Hard way)

Must be install this component:

* pandoc
* apache2
* sqlite3
* bash
* python3

In config apache write this:
 * replacing `<path_to_www_dir> ` to dir `www` (from project)
~~~
<Directory <path_to_www_dir>>
    Options Indexes FollowSymLinks
    AllowOverride None
    Require all granted
</Directory>

ScriptAliasMatch /.* <path_to_www_dir>/shellroot.sh

AddHandler cgi-script .cgi .pl .py .sh
<Directory "<path_to_www_dir>">
    AllowOverride None
    Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch
    Require all granted
</Directory>
~~~

This mods apache2 must be turn on:

* mod_cgid
* mod_cgi
* mod_alias
