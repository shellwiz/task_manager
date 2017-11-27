# Task manager

This is a lightweight web project for editing and saving your tasks.

# Installation

## Docker (Easy way)

~~~
docker build . -t <yourname_image>
docker create -p 80:80 <yourname_image>
docker start <yourname_image>
~~~

## Manually (Hard way)

Following components must be installed:

* `pandoc`
* `apache2`
* `sqlite3`
* `bash`
* `python3`

Add this to apache config:
 * replace `<path_to_www_dir>` with real path of `www` directory (from project)
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

Also these apache2 mods must be turned on:

* `mod_cgid`
* `mod_cgi`
* `mod_alias`
