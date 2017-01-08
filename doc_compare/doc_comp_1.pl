#!/usr/bin/perl
#Compare two documents and determine their veritcal angle
# 1) Read file 1 and 2
# 2) Create a hash of words, and freq for both files
# 3) Calculate angle

#In: filename 1, filename 2
#Out: array of file handles for file 1 and 2
sub read_files {
	my $file1 = shift(@_);
	my $file2 = shift(@_);
	my @handles;
	#print "file 1 : $file1 \n";
	#print "file 2 : $file2 \n";

	open(my $f1_handle, '<' ,$file1) or die "Could not open file 1 \n";
	open(my $f2_handle, '<' ,$file2) or die "Could not open file 1 \n";
	push(@handles,$f1_handle);
	push(@handles,$f2_handle);
	return @handles;
}

#In:  Array of raw data for a file
#Out: hashes with words and their count
sub count_word_frq {
	my %word_frq;
	my $file_data = shift @_;

	foreach my $entry (@{$file_data}) {
		my $line = lc($entry);
		#$line =~ s/^[alpahnum]//g;
		#print "====".$line."===\n";
	 	my @words = split(/ /,$line);
		foreach my $wentry (@words) {
			#ignore any words that match a non-word character
			if (($wentry !~ /\W/) and ($wentry !~ /^$/)) {
				#print $wentry . "\n";
				#check if the work is a key in the hash
				if (exists $word_frq{$wentry} ){
					$word_frq{$wentry} = $word_frq{$wentry} + 1;
				} else {
					$word_frq{$wentry} = 1;	
				}
			}
		}
	}
	
	return %word_frq
}

#In hash references of counted words for f1, a second hash ref for counted words for f2
#Out the radians of document angle
#This is a demonstartion of how to de reference a hash
sub calculate_angle{
	my $f1_hash_ref = shift @_;
	my $f2_hash_ref = shift @_;
	my %f1_hash = %$f1_hash_ref;
	my %f2_hash = %$f2_hash_ref;

#	foreach my $key (sort keys %f2_hash){
#	       my $key_str = $key;
#	       print "The count is : " .$f2_hash{$key}." for the word : ".$key_str."\n";
#	}
	
}

my $file1 = "doc1.txt";
my $file2 = "doc2.txt";
my $fh1;
my $fh2;
my @fh1_data_raw;
my @fh2_data_raw;
my @handles;
my %frq_count_f1;
my %frq_count_f2;

@handles = read_files ( $file1, $file2); 

$fh1 = shift(@handles);
$fh2 = shift(@handles);

@fh1_data_raw = <$fh1>;
@fh2_data_raw = <$fh2>;

%frq_count_f1 = count_word_frq ( \@fh1_data_raw );
%frq_count_f2 = count_word_frq ( \@fh2_data_raw );

#print the values of the hash for testing
#foreach my $key (sort keys %frq_count_f2){
#	my $key_str = $key;
#	print "The count is : " .$frq_count_f2{$key}." for the word : ".$key_str."\n";
#}

calculate_angle(\%frq_count_f1,\%frq_count_f2);
