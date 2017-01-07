#!/usr/bin/perl 
use warnings;
use strict;

sub is_palindrome{
    my $test_string = shift @_;
    #print "test string: $test_string \n";
    my $len_str = length($test_string);
    my $even_size = $len_str % 2;
    
    if ( $len_str < 3) {
        return 0;
    }
    my ($num_pos,$pivot_pos, $mid_char, $front_of_mid_char, $string_first_half, $string_second_half, $rev_second_half);
        
    $pivot_pos = ($len_str / 2);
    if ( $even_size == 0 ) {
        $mid_char = substr($test_string, $pivot_pos,1);
        $num_pos = (($len_str - 2)/2);
        $front_of_mid_char = substr($test_string, ($pivot_pos-1),1);
        if ( $mid_char ne $front_of_mid_char ) {
            return 0;
        }
        #print "EVEN: $test_string \n"; 
        $string_first_half = substr($test_string,0,$num_pos);
        $string_second_half = substr($test_string,($pivot_pos+1),$num_pos );
        $rev_second_half = reverse($string_second_half);
        #print "First half: $string_first_half \n";
        #print "Second half: $string_second_half \n";
        #print "Rev. Second half: $rev_second_half \n ";
        #print "The middle character is: $mid_char \n";
        #print "The preceding character is: $front_of_mid_char \n ";
        if ( $string_first_half eq $rev_second_half ) {
            return 1;
        }
        
    } else {
        $num_pos = (($len_str -1)/2);
        $string_first_half = substr($test_string,0,$num_pos);
        $string_second_half = substr($test_string,($pivot_pos+1),$num_pos );
        $rev_second_half = reverse($string_second_half);
        $mid_char = substr($test_string, $pivot_pos,1);
        
        #print "ODD: $test_string \n";
        #print "The middle characters are: $mid_char \n"; 
        #print "First half: $string_first_half \n";
        #print "Second half: $string_second_half \n";
        #print "Rev. Second half: $rev_second_half \n ";
        if ( $string_first_half eq $rev_second_half ) {
            return 1;
        }
    }    

    return 0;
}

sub proc_data{
    my $data_ref = shift @_;
    #print $data_ref;
    #print ${$data_ref}[0];
    my @local_arr;
    my @local_arr2;

    #copy all reffed items locally
    #foreach my $entry (@{$data_ref}){
    #    print $entry; 
    #}

    #copy reffed items locally
    @local_arr2 = @{$data_ref};
    
    #build substrings of of index 0 to the end
     my $orig_string = shift @local_arr2;
    $orig_string =~ s/\n//g;
    my $string_size = length($orig_string);
    my $stop_pos = $string_size -1;
    my $current_pos=0;
    my $num_pos = 3;
    my $stop=0;
    my %num_of_palindrome;
    #Step through each position on the string
    while( $current_pos < $stop_pos ) {
        #print "==============\n";
        #print "running position : $current_pos \n";
        #Run through the rest of the string from marked postion
        while ( $num_pos <= $string_size and $stop != 1) {
            my $working_str=substr($orig_string,$current_pos,$num_pos);
            my $substr_size=length($working_str);
            #print "offset: $current_pos \n";
            #print "positions: $num_pos \n";
            #print "substring size: ".$substr_size."\n";
            #print "===>>".substr($orig_string,$current_pos,$num_pos)."<=====\n";
            
            my $palindrome_found = is_palindrome($working_str);
            if ( $palindrome_found == 1) {
                #print "found ===>>>$working_str \n";
                ${$num_of_palindrome{$working_str}}=1;
            }
            $num_pos += 1;
            if ($substr_size < 3){
                $stop=1
            }
        }
        $current_pos ++;
        $num_pos = 3 ;
     }    
   
    my $total_found=0; 
    foreach my $entry ( keys %num_of_palindrome){
        print $entry ." is a palindrome: ".${$num_of_palindrome{$entry}}." \n";
	$total_found++; 

    }
   
    #print "====================================================\n";
    #print "The total number of palindromes is : $total_found \n"; 
    #print "Original String: $orig_string \n";
    #print "Size: $string_size \n"; 
    #print "last position: ".($string_size - 1)."\n";
   
    return $total_found; 
}

sub read_input{

    open (my $fh, "<", "input_palindrome.txt") or die "Could not open file input_palindrome.txt\n";
    my @data = <$fh>;
    #pass data reference
    my $answer = proc_data(\@data);
    print $answer."\n";
}

read_input
