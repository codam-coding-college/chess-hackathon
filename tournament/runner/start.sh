#!/bin/bash

# deps:
#   lftp
#   cutechess-cli
#   gnu parallel
#
# to set:
#   FILESERVER
#   LFTP_PASSWORD
#   BOT_MAXMEM
#   NUMBER_OF_PCS
#   PC_IDX
#   NJOBS

mkdir -p "$HOME/.ssh/"

set -x
until ssh-keyscan -p "$FILESERVER_PORT" "$FILESERVER" > "$HOME/.ssh/known_hosts"; do
	sleep 1
done

BOTS="$HOME/bots.txt"
MATCHES="$HOME/matches.txt"

get_bots() {
	lftp -p "$FILESERVER_PORT" --env-password "sftp://filesrv@$FILESERVER/bots" -e 'cls -1; bye' > "$BOTS"
}

echo "getting bots..." >&2
echo "I am runner number $PC_IDX" >&2

until get_bots; do
	echo "failed to get bots" >&2
	sleep 1
done

echo "got the bots" >&2

< "$BOTS" "$HOME/rr.py" | "$HOME/sched.py" "$NUMBER_OF_PCS" "$PC_IDX" > "$MATCHES"

echo "scheduled" >&2

# Build the bots
for bot in $(tr ' ' ' \n' < "$MATCHES"); do
	echo "building $bot" >&2
	dir="/bots/${bot%.*}"
	mkdir -p "$dir"

	cd "$dir"
	until lftp -p "$FILESERVER_PORT" --env-password "sftp://filesrv@$FILESERVER/bots" -e "get $bot; bye"; do
		sleep 1
	done

	tar -xvf "$bot"
	rm "$bot"

	chmod -R o-w "$dir"

	chown -R bot:bot "$dir"
	# if the build fails or the project is not setup correctly, we will
	# count it as a loss or draw when actually doing the match
	env -i sudo -u bot /usr/bin/make -j8
	chown -R root:root "$dir"

	cd -
done

set -x
cat "$MATCHES" | tr ' ' '\n' | parallel -j "$NJOBS" --max-args=2 "$HOME/match.sh" {1} {2}
