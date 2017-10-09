#!/bin/bash

echo "HTTP/1.1 200 OK"
echo "Date: $(date)"
echo "Connection: close"
echo "Server: mylittlewebserver/0.1"
echo "Refresh: 0;url=http://localhost:8889"

echo ""
echo "<html>"
echo "	<head>"
echo "		<title> Connection </title>"
echo "	</head>"
echo "	<body>"
echo "		Redirecting... <br/>"
echo "	</body>"
echo "</html>"
