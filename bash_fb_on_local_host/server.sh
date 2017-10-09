#!/bin/bash

trap ctrl_c INT
function ctrl_c () {
	if [ -p server.pipe ]; then
                rm server.pipe
                fi
                exit 0
}

#if there isn't a server pipe
if ! [ -p server.pipe ];then
	mkfifo server.pipe
	exit 0
fi

while true; do
	read command id friend message < server.pipe
	echo "HTTP/1.1 200 OK"
	echo "Date: $(date)"
	echo "Connection: close"
	echo "Server: mylittlewebserver/0.1"
	echo "Content-Type: text/html"

	echo ""
	echo "<html>"
	echo "	<head>"
	echo "		<title> Connected </title>"
	echo "	</head>"
	echo "	<body>"
	echo "		<p style='font:bold 18px Serif;'>Welcome User: $id </p><br/>"
	echo " 		<p style='font:bold 18px Serif;'> You've been redirected to a server/session that is dedicated to you </p><br/>"
	echo "	</body>"
	echo "</html>"


	case "$command" in
		create)
			echo $(./create.sh $id) > $id.pipe
			echo user $id has been created
		;;
		add)
			echo $(./add_friend.sh $id $friend) > $id.pipe
			echo $id and $friend are now friends		
		;;
		post)
			echo $(./post_messages.sh $id $friend $message) > $id.pipe
			echo $id $friend $message
		;;
		display)
			echo $(./display_wall.sh $id) > $id.pipe
			echo Here is $id messages. 
			./display_wall.sh $id
		;;

		*)
			echo "Usage: $0 {create|add|post|display}"
			exit 1
esac
done
