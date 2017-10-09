#!/bin/bash

clientport=8889

sed "s|http://localhost:[0-9]*|http://localhost:$clientport|" exec_master.sh > exec_master.sh_ && mv exec_master.sh_ exec_master.sh && chmod +x exec_master.sh


while true; do
	#new connection
	./exec_master.sh | nc -l 8888 | ./read_master.sh $clientport
	clientport=$((clientport+1))
	sed"s|url=http://localhost:[0-9]*|url=http://localhost:$clientport|" exec_master.sh > exec_master.sh_ && mv exec_master.sh_ exec_master.sh && chmod +x exec_master.sh

done
