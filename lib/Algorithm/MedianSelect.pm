# $Id: MedianSelect.pm,v 0.01 2004/01/22 10:52:42 sts Exp $

package Algorithm::MedianSelect;

use 5.006;
use base qw(Exporter);
use strict 'vars';
use warnings;

our $VERSION = '0.01';

our @EXPORT_OK = qw(median);

sub croak {
    require Carp;
    &Carp::croak;
}

sub median {
    my $items = $_[0];
    croak q~usage: median(\@items)~ unless @$items;
      
    croak q~need odd number of elements~ if @$items % 2 == 0;
    
    my $eval = $$items[0] =~ /\d/ 
      ? grep /\d/,     @$items
      : grep /[a-z]/i, @$items;
    croak q~mixed types aren't supported~ if $eval != @$items;
    
    my $mode = $$items[0] =~ /\d/ ? 'num' : 'char';
    my $i = int(@$items / 2);
       
    return (&{"_median_$mode"}($items))[$i];
}

sub _median_num { 
    my $items = $_[0];

    return sort {$a <=> $b} @$items;
}

sub _median_char {
    my $items = $_[0];

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
Numeric and characteristic items are processed; mixed types
are unsupported.

=head1 FUNCTIONS

=head2 median

Returns the median item.

 $median = median(\@items);

=head1 SEE ALSO

http://www.cs.sunysb.edu/~algorith/files/median.shtml

=cut
