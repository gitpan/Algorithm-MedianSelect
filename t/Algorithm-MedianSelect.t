#! /usr/local/bin/perl

use strict;
use warnings;
use Algorithm::MedianSelect qw(median);

use Test::More tests => 4;

BEGIN {
    my $PACKAGE = 'Algorithm::MedianSelect';
    use_ok( $PACKAGE );
    require_ok( $PACKAGE );
}

my (@num_items, @char_items);

@num_items  = qw(1 2 3 5 6 7 9 12 14 19 21);
@char_items = qw(abcdefgh bc def ghij klm pqrstu vwxyz);

is( median( \@num_items ), 7, 'median( \@num_items );' );
is( median( \@char_items ), 'ghij', 'median( \@char_items );' );
