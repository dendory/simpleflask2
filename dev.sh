#!/bin/bash

status()
{
	sudo docker ps | grep dendoryflask
	return 0
}

stop()
{
	echo -n "Shutting down local container... "
	sudo docker stop dendoryflask
	return 0
}

start()
{
	echo -n "Starting up local container... "
	sudo docker start dendoryflask
	return 0
}

build()
{
	echo -n "Building and running local container... "
	sudo docker container rm dendoryflask
	sudo docker build -t dendoryflask .
	sudo docker run --name dendoryflask -d -p 8080:80 -v `pwd`:/usr/share/dendoryflask --network bridge dendoryflask
	return 0
}

case "$1" in
	start)
		start
		;;
	stop)
		stop
		;;
	status)
		status
		;;
	restart)
		stop
		start
		;;
	build)
		stop
		build
		;;
	*)
		echo "Usage: dev.sh {build|start|stop|restart|status}"
		exit 1
		;; esac
exit $?
