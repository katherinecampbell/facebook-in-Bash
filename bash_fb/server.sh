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
	case "$command" in
		create)
			echo $(./create.sh $id) > $id.pipe
		;;
		add)
			echo $(./add_friend.sh $id $friend) > $id.pipe
		;;
		post)
			echo $(./post_messages.sh $id $friend $message) > $id.pipe
		;;
		display)
			echo $(./display_wall.sh $id) > $id.pipe
		;;
		*)
			echo "Usage: $0 {create|add|post|display}"
			exit 1
esac
done
