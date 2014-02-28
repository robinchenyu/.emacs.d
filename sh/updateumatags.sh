#!/usr/bin/sh
echo "`date` update uma tags `pwd` ..."
rm -rf file.list

find appf -iname "*.[hc]" > file.list
find buf_func -iname "*.[hc]" >> file.list
find cmpp -iname "*.[hc]" >> file.list
find cngp -iname "*.[hc]" >> file.list
find comm -iname "*.[hc]" >> file.list
find ctrl -iname "*.[hc]" >> file.list
find if_mms -iname "*.[hc]" >> file.list
find include -iname "*.[hc]" >> file.list
find info -iname "*.[hc]" >> file.list
find ketama -iname "*.[hc]" >> file.list
find logsvr -iname "*.[hc]" >> file.list
find mfilefunc -iname "*.[hc]" >> file.list
find mm1 -iname "*.[hc]" >> file.list
find morouter -iname "*.[hc]" >> file.list
find msgconvert -iname "*.[hc]" >> file.list
find mtrouter -iname "*.[hc]" >> file.list
find os -iname "*.[hc]" >> file.list
find report -iname "*.[hc]" >> file.list
find report_res -iname "*.[hc]" >> file.list
find rest -iname "*.[hc]" >> file.list
find router -iname "*.[hc]" >> file.list
find sce_wbs -iname "*.[hc]" >> file.list
find sceh -iname "*.[hc]" >> file.list
find sendm -iname "*.[hc]" >> file.list
find sends -iname "*.[hc]" >> file.list
find sgip -iname "*.[hc]" >> file.list
find smgp -iname "*.[hc]" >> file.list
find smpp -iname "*.[hc]" >> file.list
find sslincl -iname "*.[hc]" >> file.list
find ucomm -iname "*.[hc]" >> file.list
find vgwagt -iname "*.[hc]" >> file.list
find wappush -iname "*.[hc]" >> file.list
find wbs -iname "*.[hc]" >> file.list
find uxi -iname "*.[hc]" -or -iname "*.cpp" -or -iname "*.hpp" >> file.list

/usr/local/bin/gtags -f file.list
