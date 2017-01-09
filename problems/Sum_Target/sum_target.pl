#!/usr/bin/perl

# Given a list of numbers, find a pair of numbers that sum to a target
# Starting at position 0, build a hash of current array value and what is needed.
# Check if what is needed to meet the target exists in the hash.
# If it is found, you are done.
# Other wise add the next array valued to the hash and what is needed for that value to meet the target.

#read input file
#input file format
# < target number >
# < array value 0 >
# .....
# < array value n >
