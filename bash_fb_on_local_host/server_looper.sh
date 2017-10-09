#!/bin/bash

if [ $# -ne 2 ]; then
	echo "The server needs the port and username as arguments"
fi
clientport=$1
id=$2

while true; do
	echo "READ"
	./server.sh $id | nc -l $clientport | ./read.sh $id
	echo "EXEC"
done
