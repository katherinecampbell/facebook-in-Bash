#!/bin/bash

read x
while [ ! -z "$x" ]; do
	if [[ $x == GET* ]] ; then
		url=`echo -e $x | cut -d' ' -f2`
		echo url=$url

		command=`echo $url | cut -d'/' -f2 `
		echo command="$command"

		id=`echo $url | cut -d '/' -f3`
		echo id="$id"
	
		friend=`echo $url | cut -d '/' -f4`
		echo friend="$friend"
		
		message=`echo $url | cut -d '/' -f5`
		echo message="$message"
			
	
	echo $command $id $friend $message >> server.pipe
	fi
	read x
done
