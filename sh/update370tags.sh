#!/usr/bin/sh
echo "`date` update 370 gtags ..."

rm -rf file.list

find . -iname "*.[hc]" > file.list

/usr/bin/gtags -f file.list

