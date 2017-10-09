#!/bin/bash
read x
while [ ! -z "$x" ]; do
	#echo $x | grep 'GET' | cut -d " " -f2	
	#echo line just read is: $x
	if [[ $x == GET* ]] ; then
		url= echo -e $x | cut -d' ' -f2`
		echo url=$url 
	fi	
	read x
done
