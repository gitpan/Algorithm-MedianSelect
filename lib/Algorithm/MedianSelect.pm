# $Id: MedianSelect.pm,v 0.04 2004/01/22 10:52:42 sts Exp $

package Algorithm::MedianSelect;

use 5.006;
use base qw(Exporter);
use strict 'vars';
use warnings;

our $VERSION = '0.04';

our @EXPORT_OK = qw(median);

sub croak {
    require Carp;
    &Carp::croak;
}

sub median {
    my $items = shift;
    croak q~Usage: median(\@items)~ unless @$items;
    
    my $grep = $$items[0] =~ /\d/ 
      ? grep /\d/,     @$items
      : grep /[a-z]/i, @$items;
    croak q~Mixed types aren't supported~ if $grep != @$items;    
    
    my $mode = $$items[0] =~ /\d/ ? 'num' : 'char';
    
    croak q~Need odd number of elements~ 
      if $mode eq 'char' && @$items % 2 == 0;
      
    my $i = @$items / 2;
    
    if ($mode eq 'num' && length $i == 1) {
        my @medians = (_sort_num($items))[($i-1,$i)];
	return ($medians[0] + (($medians[1] - $medians[0]) / 2));
    }
    else { return (&{"_sort_$mode"}($items))[int($i)] }
}

sub _sort_num { 
    my $items = shift;

    return sort { $a <=> $b } @$items;
}

sub _sort_char {
    my $items = shift;

    my %length;
    for (@$items) { $length{$_} = length }
     
    return sort { $length{$a} <=> $length{$b} } @$items; 
}

1;
__END__

=head1 NAME

Algorithm::MedianSelect - median finding algorithm.

=head1 SYNOPSIS

 use Algorithm::MedianSelect qw(median);

 @num_items = qw(1 2 3 5 6 7 9 12 14 19 21);

 print median(\@num_items);

=head1 DESCRIPTION

C<Algorithm::MedianSelect> finds the item which is smaller 
than half of the items and bigger than half of the items.
Numbers and character strings are processed; character strings 
are evaluated by their length. Mixed types are unsupported.

=head1 FUNCTIONS

=head2 median

Returns the median item.

 $median = median(\@items);

=head1 SEE ALSO

L<http://www.cs.sunysb.edu/~algorith/files/median.shtml>

=cut
