#!/bin/sh
BIN_PATH=$GOPATH/bin
cd $BIN_PATH
COMMAND_GO_SERVER=$BIN_PATH/jenkins_go_http_server
go_server_pid=`pidof ${COMMAND_GO_SERVER}`
echo "Pid of Go Server is $go_server_pid"

if [ $go_server_pid ]; then
	date +"%Y/%m/%d %H:%M:%S-Go Server Restart"
	kill -9 $go_server_pid
	sudo screen -d -m ./jenkins_go_http_server
	date +"%Y/%m/%d %H:%M:%S-Restart completed"
else
	sudo screen -d -m ./jenkins_go_http_server
	date +"%Y/%m/%d %H:%M:%S-Start completed"
fi
