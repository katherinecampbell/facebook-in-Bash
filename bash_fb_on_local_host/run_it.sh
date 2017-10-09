#!/bin/bash
#This is a script to run the pipe that connects server.sh and read.sh with the browser

while true; do
	 ./server.sh | nc -l 8888 | ./read.sh; 
done
