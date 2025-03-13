#!/bin/bash

FILE="chessbot.tar.gz"

if [ -z "$1" ]; then
	echo "No file specified, assuming working directory" >&2
	DIR="$PWD"
else
	DIR="$(dirname $1)"
	FILE="$(basename $1)"
fi

docker run -v "$DIR:/src" hyxogen/codam-chessbot /root/chess-hackathon/tools/check.sh "/src/$FILE"
