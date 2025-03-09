#!/usr/bin/python
import sys

if len(sys.argv) != 3:
    print("usage {} <number_of_pcs> <idx>".format(sys.argv[0]))
    exit(0)

nbots=int(sys.argv[1])
idx=int(sys.argv[2])

matches=list(map(str.strip,open(0).readlines()))

mpb = (len(matches)+1)//nbots

off = mpb*idx
print("\n".join(matches[off:off+1]))
