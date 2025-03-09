#!/bin/bash

if [ "$#" != "3" ]; then
	echo "usage $0 <path to bots> <path to games> <port>"
	exit 0
fi

set -a
source .env
set +a

port="$3"

bots_dir="$1"
case "$bots_dir" in
	/*)
		#absolute path do nothing
		;;
	*)
		echo "warning $bots_dir seems to be a relative path, will make it $PWD/$bots_dir" >&2
		bots_dir="$PWD/$bots_dir"
		;;
esac
games_dir="$2"
case "$games_dir" in
	/*)
		#absolute path do nothing
		;;
	*)
		echo "warning $games_dir seems to be a relative path, will make it $PWD/$games_dir" >&2
		games_dir="$PWD/$games_dir"
		;;
esac

docker run \
	--env-file .env \
	-v "$bots_dir:/var/lib/jail/bots" \
	-v "$games_dir:/var/lib/jail/games" \
	-p "$port:22" \
	hyxogen/codam-chesssrv
