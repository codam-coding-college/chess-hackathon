#!/bin/bash

set -ex

ARCHIVE="chessbot.tar.gz"

chown -R root:root "/src/"

eprintln() {
	echo $@ >&2
}

error() {
	eprintln $@
	exit 1
}

if [ -z "$1" ]; then
	error "usage $0 <chessbot>"
	exit 1
fi

if [ "$(basename "$1")" != "$ARCHIVE" ]; then
	error "the archive must be named '$ARCHIVE'"
fi

DIR=$(mktemp -d)
cp "$1" "$DIR"

cd "$DIR"

tar -xf "$ARCHIVE"

if [ '!' -r Makefile ]; then
	error "No readable Makefile in archive"
fi

if grep -- -Werorr Makefile; then
	eprintln "warning: found -Werror please see submitting.md"
fi

make

if [ '!' -x chessbot ]; then
	error "No executable chessbot found"
fi

# echo "uci" | ./chessbot | grep "id name" > /dev/null

cutechess-cli -engine cmd=/root/chess-hackathon/example/chessbot -engine cmd=./chessbot -each proto=uci tc=/5 book=/dev/null bookdepth=1 -rounds 1 -concurrency 1 -pgnout check.pgn

if [ ! -s check.pgn ]; then
	error "Could not run test game, the engine probably does not implement UCI properly"
fi

echo "OK"
