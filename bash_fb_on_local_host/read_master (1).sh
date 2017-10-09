#!/bin/bash

if [ $# -ne 1 ]; then
	echo "The user to be assigned a new port"
	exit 1
fi
clientport=$1
echo port=$clientport
read x

while [ ! -z "$x" ]; do 
	if [[ $x == GET* ]] ; then
		url=`echo -e $x | cut -d' ' -f2`
		echo url=$url
	
		id=`echo -n "$url" | sed 's|\/||'`
		echo id="$id"
		./server_looper.sh $clientport $id &
	fi
	read x
done
