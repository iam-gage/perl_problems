#!/usr/bin/python
import sys

# read 3 lines of input
# meal cost
# % tip as integer
# % tax as integer
# print total cost

cost = float(sys.stdin.readline())
tip_pct = float(sys.stdin.readline()) / 100
tax_pct = float(sys.stdin.readline()) / 100

total = int((cost * tip_pct) + (cost * tax_pct) + cost)
print(total)
