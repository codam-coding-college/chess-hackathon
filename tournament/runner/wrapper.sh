#!/bin/bash

if [ -z "$1" ]; then
	echo "usage $0 <user> <command>"
	exit 1
fi
if [ -z "$2" ]; then
	echo "usage $0 <user> <command>"
	exit 1
fi

exec env -i sudo -u "$1" /usr/bin/prlimit --as="$BOT_MAXMEM" --nproc=1 "$2"
