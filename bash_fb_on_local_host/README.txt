A quick guide to the interaction between scripts.
More details are in the write-up.

These scripts run a client and a server side service wherein a client can create a user and write and read messages to other users.
The goal is for this to actually run on the localhost browser.

type user and commands after slash in http://localhost:8888/. 
For example, to create a user named Jim, type “/create/Jim” after the original URL.  

run client and exec_server (this connects you to the HTML code)

run_it.sh pipes server.sh with the nc -l 8888 connection (local host) and also with read.sh.

server_looper.sh allows you to submit more than one url, command, and username

The server_looper.sh requires a client port and the id so each user gets its own port to the browser.  
it pipes this to server.sh  with an already given $id, a connection, and then read.sh.

BELOW IS A WORK IN PROGRESS!

The master_loop.sh selects the client port that the server_looper receives.

If one port is occupied, it finds another and assigns that.

With the exec_master.sh, the web browser tells the user that they are being redirected to another port.

The read_master.sh plugs the given client port with the URL and the user id and then sends that to the server_looper.sh. 