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
		#$line =~ s/\n//;
		#print "====".$line."===\n";
	 	my @words = split(/ /,$line);
		foreach my $wentry (@words) {
			print $wentry . "\n";
		}
	}
	
	return %word_frq
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
#%frq_count_f2 = count_word_frq ( @fh2_data_raw );

