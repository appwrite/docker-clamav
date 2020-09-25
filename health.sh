#!/bin/sh

if [ ! "$(echo PING | nc localhost 3310)" = "PONG" ]; then
	echo "ping failed"
	exit 1
fi
