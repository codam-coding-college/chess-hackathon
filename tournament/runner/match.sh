#!/bin/bash

echo "running match..." >&2

if [ "$#" != 2 ]; then
	echo "$# usage $0 <bot1> <bot2>"
	exit 1
fi


bot1_name="${1%.*}"
bot2_name="${2%.*}"

echo "running  $bot1_name vs $bot2_name"
pgn_file="$3"

bot1_dir="/bots/$bot1_name"
bot2_dir="/bots/$bot2_name"

chown -R white:white "$bot1_dir"
chown -R black:black "$bot2_dir"

dir="$(mktemp -d)"
pgn_file="$dir/$bot1_name-$bot2_name.pgn"

set -x

cutechess-cli \
	-engine cmd="$HOME/wrapper.sh" arg=white arg="$bot1_dir/chessbot" \
	-engine cmd="$HOME/wrapper.sh" arg=black arg="$bot2_dir/chessbot" \
	-each proto=uci tc=/60 book=/dev/null bookdepth=1 -rounds 2 \
	-concurrency 2 \
	-pgnout "$pgn_file"

chown -R root:root "$bot1_dir"
chown -R root:root "$bot2_dir"

until lftp -p "$FILESERVER_PORT" --env-password "sftp://filesrv@$FILESERVER/games" -e "put $pgn_file; bye"; do
	exit 1
	sleep 1
done
