#!/usr/bin/perl
use warnings;
use strict;

# Given a list of numbers, find a pair of numbers that sum to a target
# Starting at position 0, build a hash of current array value and what is needed.
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
        my @result = <$file_handle> ;
        return @result;
}

my %needed_value_hash;
my @data = read_input ( "input_file_sum_target_0.txt" );
my $target = shift @data;
my @clean_data = grep (/\d/, @data);

foreach my $entry ( @clean_data ) {
        my $second_operand = abs ( $target - $entry );
                $entry =~ s/\n//;
                # build the hash of the needed operand for each array entry
                if ( not exists $needed_value_hash{$entry} ) {
                        $needed_value_hash{$entry} = $second_operand ;
                }
                # Demonstration of using the thin arrow to access hash entries
                if ( exists $needed_value_hash{$second_operand} ){
                        my $hashref = \%needed_value_hash;
                        print $entry . " *** \n";
                        print $hashref -> {$entry} . "\n";
                        print $hashref -> {$second_operand}. "\n";
                        exit;
                }
        }

