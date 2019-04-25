#!/bin/sh
GOPATH=/var/lib/jenkins/workspace/jenkins_go_http_server
BIN_PATH=$GOPATH/bin
cd $BIN_PATH
echo "pwd is $PWD"
COMMAND_GO_SERVER=$BIN_PATH/jenkins_go_http_server
go_server_pid=`pidof ${COMMAND_GO_SERVER}`

if [ $go_server_pid ]; then
	echo "Pid of Go Server is $go_server_pid"
	date +"%Y/%m/%d %H:%M:%S-Go Server Restart"
	kill -9 $go_server_pid
	sudo screen -d -m ./jenkins_go_http_server
	date +"%Y/%m/%d %H:%M:%S-Restart completed"
else
	sudo screen -d -m ./jenkins_go_http_server
	date +"%Y/%m/%d %H:%M:%S-Start completed"
fi
