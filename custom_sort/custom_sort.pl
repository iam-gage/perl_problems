#!/usr/bin/perl
use warnings;
use strict;
#This perl code demonstartes array referencing
#Various operations on hashes, including sorting
#
sub process{	
	my $arr_ref = shift @_;
	#print $arr_ref;
	#print ${$arr_ref}[0];
	my $size=scalar(@{$arr_ref});
	my $count=0;
	my @local_arr;
	my @result;
	my %num_seen_of;
	
	#copy the referenced array
	while ($count < $size){
		push(@local_arr, ${$arr_ref}[$count]); 
		$count++;
	}
	
	
	#create a hash of counts of each value
	foreach my $item(@local_arr){
		if( exists $num_seen_of{$item} ){
			#print "key $item has value: $num_seen_of{$item}\n";
			$num_seen_of{$item} = $num_seen_of{$item} + 1;
		} else {
			#print "key $item has no value in the hash \n";
		 	$num_seen_of{$item} = 1;	
		}
	}
	
	#display the hash that was just built
	foreach my $key (keys %num_seen_of){
		my $key_var = $key;
		$key_var =~ s/\n//g;
		#print "$var is seen $num_seen_of{$key} times \n";
	}

	#check the count of each array element
	foreach my $item(@local_arr){
		my $message=$item ." occurs " . $num_seen_of{$item}. " times ";
		$message =~ s/\n//g;
		#print $message . "\n";
	}

	#determine all elements with more than 1 entry
	#hash sorted based on number of occurrences
	foreach my $key (sort {$num_seen_of{$b} cmp $num_seen_of{$a}} keys %num_seen_of){	 
		my $key_str = $key;
		$key_str =~ s/\n//g;
		#print " Key is: $key_str Value is : $num_seen_of{$key} \n";
		#Ingore single occurences and save the other
		if( $num_seen_of{$key} != 1 ) {
			my $entry = $key_str;
			my $num_copies = $num_seen_of{$key};
			while ( $num_copies > 0 ){
				#print $entry . "\n";
				push(@result,$entry."\n");
				$num_copies --;
			}
		}
			
	}

	#hash sorted, this time only show single occurrences
	foreach my $key (sort { $a cmp $b } keys %num_seen_of){
		my $key_str = $key;
		$key_str =~ s/\n//g;
		if ( $num_seen_of{$key} == 1 ){
			push(@result,$key_str."\n");
			#print $key_str."\n";
		}
	} 

	print @result;
	
}

sub read_input{
	my $fh;
	open($fh,"<","input_custom_sort.txt") or die "could not load file \n";
	my @array=<$fh>;
	process( \@array);
}
read_input
