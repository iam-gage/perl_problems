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

sub read_input {
   my $file_name = shift @_;
   my $file_handle;
   open ( $file_handle, '<' , $file_name ) or die "could not open the input file $file_name \n";
   return <$file_handle> ;
}

my @data = read_input ( "input_file_sum_target_0.txt" );
