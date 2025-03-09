#!/bin/sh

ssh-keygen -A
echo "filesrv:$LFTP_PASSWORD" | chpasswd

chown -R :filesrv /var/lib/jail/bots
chmod -R 750 /var/lib/jail/bots

chown -R :filesrv /var/lib/jail/games
chmod -R 730 /var/lib/jail/games

exec /usr/sbin/sshd -f /sshd_config -D -e
