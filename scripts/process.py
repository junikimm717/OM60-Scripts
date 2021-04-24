#!/usr/bin/env python3

from scipy.stats import describe

with open("data", "r") as r:
    x = list(map(float, r.read().split()))
    print(describe(x))

