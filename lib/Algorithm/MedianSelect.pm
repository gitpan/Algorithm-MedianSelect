package Algorithm::MedianSelect;

$VERSION = '0.05';
@EXPORT_OK = qw(median);

use strict 'vars';
use base qw(Exporter);
use Carp 'croak';

sub median {
    my($items) = @_;
    croak 'usage: median(\@items)' unless @$items;
    
    my $grep = ($items->[0] =~ /\d/) 
      ? grep /\d/,     @$items
      : grep /[a-z]/i, @$items;
    croak "Mixed types aren't supported" if $grep != @$items;    
    
    my $mode = ($items->[0] =~ /\d/) ? 'num' : 'char';    
    croak 'Need odd number of elements'
      if ($mode eq 'char' && @$items % 2 == 0);
      
    my $i = @$items / 2;    
    if ($mode eq 'num' && length $i == 1) {
        my @medians = (_sort_num($items))[$i-1,$i];
	return($medians[0] + (($medians[1] - $medians[0]) / 2));
    }
    else { return(&{"_sort_$mode"}($items))[int($i)] }
}

sub _sort_num { 
    my($items) = @_;
    return sort { $a <=> $b } @$items;
}

sub _sort_char {
    my($items) = @_;
    my %length;
    for my $item (@$items) { 
        $length{$item} = length($item);
    }     
    return sort { $length{$a} <=> $length{$b} } @$items; 
}

1;
__END__

=head1 NAME

Algorithm::MedianSelect - Median finding algorithm

=head1 SYNOPSIS

 use Algorithm::MedianSelect qw(median);

 @num_items = qw(1 2 3 5 6 7 9 12 14 19 21);

 print median(\@num_items);

=head1 DESCRIPTION

This module finds the item which is smaller than half of 
the items and bigger than half of the items.
Numbers and character strings are processed; character strings 
are evaluated by their length. Mixed types are unsupported.

=head1 FUNCTIONS

=head2 median

Returns the median item.

 $median = median(\@items);

=head1 SEE ALSO

L<http://www.cs.sunysb.edu/~algorith/files/median.shtml>

=cut
