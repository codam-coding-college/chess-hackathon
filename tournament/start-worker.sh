#!/bin/bash

if [ -z "$1" ]; then
	echo "usage $0 <pc number>"
	exit 0
fi

PC_IDX="$1"

docker run \
	--env-file .env \
	-e PC_INDEX="$PC_IDX" \
	--net=host \
	hyxogen/codam-chessbot \
	/root/start.sh
