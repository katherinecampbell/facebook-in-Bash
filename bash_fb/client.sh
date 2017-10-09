#!/bin/bash
client=$1
#trap ctrl_c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
	if [ -p $client.pipe ]; then
		rm $client.pipe
		fi
		exit 0
}

if [ $# -eq 0 ]; then
	echo ERROR. No user provided.
	exit 1

elif [ $# -gt 1 ]; then
	echo ERROR. More than one user.
	exit 1
else
	mkfifo $client.pipe
	echo client pipe has been created.

while true; do
read command arg 
echo $command $client $arg > server.pipe
read line <$client.pipe;
echo $line
done
exit 0
fi
