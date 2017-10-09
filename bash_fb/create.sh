#!/bin/bash

id="$1"

if [ $# -eq 0 ]; then
	echo ERROR. No user provided.
	exit 1
fi

if [ -d "$id" ]; then
	echo This user already exists.
	exit 1
fi

if [ ! -d "$id" ]; then
	echo hi
	./p.sh "$1"_lock
	mkdir ~/facebook/"$id"
	touch ~/facebook/"$id"/wall
	touch ~/facebook/"$id"/friends
	./v.sh "$1"_lock
	echo User created.
	exit 0
fi
