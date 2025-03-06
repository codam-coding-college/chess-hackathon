#!/bin/bash

set -e

ARCHIVE="chessbot.tar.gz"

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

echo "uci" | ./chessbot | grep "id name" > /dev/null

echo "OK"
