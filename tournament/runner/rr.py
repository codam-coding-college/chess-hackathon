#!/usr/bin/python3

from itertools import combinations

bots = list(map(str.strip, open(0).readlines()))

for a, b in combinations(bots, 2):
    if a == b:
        continue
    print(f"{a} {b}")
