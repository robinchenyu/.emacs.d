#!/usr/bin/sh
echo "`date` update gtags ..."

rm -rf file.list

find com -iname "*.[hc]" > file.list
find smtrans -iname "*.[hc]" >> file.list

/usr/bin/gtags -f file.list

