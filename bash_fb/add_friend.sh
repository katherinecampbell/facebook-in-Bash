#!/bin/bash

id=$1
friend=$2

if [ ! -d "$id" ]; then
	echo ERROR. This user does not exist.
	exit 1
fi

if [ ! -d "$friend" ]; then
	echo ERROR. This user does not exist.
	exit 1
fi

if  grep "^$friend" "$id"/friends > /dev/null ; then
	echo "$id" and "$friend" are already friends.
	exit 1


else
	./p.sh "$id"_lock
	./p.sh "$friend"_lock
	echo "$id" >> ~/facebook/"$friend"/friends
	echo "$friend" >> ~/facebook/"$id"/friends
	echo "$id" and "$friend" are now officially friends.
	./v.sh "$id"_lock
	./v.sh "$friend"_lock
fi
exit 0
