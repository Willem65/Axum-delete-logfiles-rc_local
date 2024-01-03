#!/bin/bash

# example for making a test file (  dd if=/dev/zero of=/var/log/axum-engine.log bs=5100000 count=10 )

Fref=50000000

echo "Check of File exists!" > "/var/log/axumdeleteLog.log"

if [ -f /var/log/axum-engine.log ]; then
    echo "File axum-engine.log exists!" >> "/var/log/axumdeleteLog.log"
	
	FileSize="$(ls -l /var/log/axum-engine.log | grep '1 root root' | awk '{ print $5 }' 2>/dev/null)"
	
	if (( $FileSize > Fref )); 
	then
		echo "axum-engine.log is greater than ( File deleted )" >> "/var/log/axumdeleteLog.log"
		echo $Fref >> "/var/log/axumdeleteLog.log"
		rm /var/log/axum-engine.log
	else
		echo "axum-engine.log is smaller than ( File not deleted )" >> "/var/log/axumdeleteLog.log"
		echo $Fref >> "/var/log/axumdeleteLog.log"
	fi
	
else
    echo "File axum-engine.log does not exist!" >> "/var/log/axumdeleteLog.log"
fi






counter=7

for (( n=1 ; n<=$counter ; n++ )); 
do
	if [ -f /var/log/axum-engine.log.$n ]; then
		echo "File axum-engine.log.$n exists!" >> "/var/log/axumdeleteLog.log"
		
		FileSize="$(ls -l /var/log/axum-engine.log.$n | grep '1 root root' | awk '{ print $5 }' 2>/dev/null)"
		
		if (( $FileSize > Fref )); 
		then
			echo "axum-engine.log.$n is greater than ( File deleted )" >> "/var/log/axumdeleteLog.log"
			echo $Fref >> "/var/log/axumdeleteLog.log"
			rm /var/log/axum-engine.log.$n
		else
			echo "axum-engine.log.$n is smaller than ( File not deleted )" >> "/var/log/axumdeleteLog.log"
			echo $Fref >> "/var/log/axumdeleteLog.log"
		fi
		
	else
		echo "File axum-engine.log.$n does not exist!" >> "/var/log/axumdeleteLog.log"
	fi
done