# Submitting
***PLEASE CAREFULLY READ THIS ENTIRE FILE!!!***

Please make sure to properly submit your bot(s) to avoid any trouble during the
tournament. ***Your bot may be disqualified if you do not properly turn it
in!***

## Your project structure
The root of your project dir MUST contain a Makefile, even if you don't use a
compiled language like C++. This Makefile is responsible for creating a file in
the same directory named `chessbot`. This file MUST have READ and EXECUTE
permissions. This file MUST execute your chess-bot.

An example:
```
$ ls -lra
total 0
drwxr-xr-x  2 root root  40 Mar  6 10:44 src
-rw-r--r--  1 root root 240 Mar  6 10:44 Makefile
drwxr-xr-x  6 root root 180 Mar  6 10:45 .git
drwxrwxrwt 12 root root 240 Mar  6 10:44 ..
drwx------  4 root root 100 Mar  6 10:45 .
$ make
$ ls -lra
$ ls -lra
total 0
drwxr-xr-x  2 root root  40 Mar  6 10:44 src
-rw-r--r--  1 root root 240 Mar  6 10:44 Makefile
drwxr-xr-x  6 root root 180 Mar  6 10:45 .git
-rwxr-xr-x  1 root root 560 Mar  6 10:46 chessbot
drwxrwxrwt 12 root root 240 Mar  6 10:44 ..
drwx------  4 root root 120 Mar  6 10:46 .
```
NOTE: You don't need to have a src directory per se, this is just an example

Feel free to just make a wrapper script if you use an interpreted language like
python. For example:
```bash
#!/bin/bash
python3 your_bot.py
```

## Turning in
Create a `chessbot.tar.gz` file with the contents of your root project
directory. Make sure all the files (including .git) are present in the archive

An example:
```
$ ls -lra
total 0
drwxr-xr-x  4 root root 100 Mar  6 10:56 your_chessbot_dir
drwxrwxrwt 13 root root 260 Mar  6 10:55 ..
drwx------  3 root root  60 Mar  6 10:56 .
$ ls -lra your_chessbot_dir/
total 4
drwxr-xr-x 2 root root  40 Mar  6 10:44 src
-rw-r--r-- 1 root root 240 Mar  6 10:55 Makefile
drwxr-xr-x 6 root root 180 Mar  6 10:45 .git
drwx------ 3 root root  60 Mar  6 10:56 ..
drwxr-xr-x 4 root root 100 Mar  6 10:56 .
$ tar -zcf chessbot.tar.gz -C your_chessbot_dir/ .
$ ls
chessbot.tar.gz  your_chessbot_dir
```

You then turn in the `chessbot.tar.gz`

## Your engine
Your engine MUST report your teamname as the engine names, and ALL your
teammates their intra names as authors when responding to the `uci` command.

An example:
```
$ ./chessbot
uci
id name A cool team name
id author intraid1 intraid2 intraid3
uciok
```

# Tips
- **DO NOT USE -Werror**. You run the risk of your code not compiling when using
a newer compiler version
- Check the names of your files, is the bot named `chessbot`? Is the archive file
named `chessbot.tar.gz`?
- Use the `tournament/runnertools/quick-check.sh` script to check if your archive is probably
correct
- Make sure that the `chessbot` program is executable
