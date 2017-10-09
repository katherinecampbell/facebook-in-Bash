#!/bin/bash

sender="$1"
receiver="$2"
message="${@:3}"

if [ ! -d "$sender" ]; then
	echo ERROR. "$sender" doesn't exist.
	exit 1
fi

if [ ! -d "$receiver" ]; then
	echo ERROR. "$receiver" doesn't exist.
	exit 1
fi

if grep "^$receiver" "$sender"/friends > /dev/null ; then
	./p.sh "$sender"_lock
	./p.sh "$receiver"_lock
	echo "$sender: $message" >> ~/facebook/"$receiver"/wall
	./v.sh "$sender"_lock
	./v.sh "$receiver"_lock

else
	echo You must be friends with "$receiver" to send them a message.
	exit 1
	#echo "'$sender'\: '$message'" >> ~/facebook/"$receiver"/wall
fi

exit 0
