#!/bin/bash

id=$1

if [ ! -d "$id" ]; then
	echo ERROR. User "$id" does not exist.
	exit 1
else
	./p.sh "$id"_lock
	echo start of file
	cat ~/facebook/"$id"/wall
	echo end of file
	./v.sh "$id"_lock
fi
exit 0
