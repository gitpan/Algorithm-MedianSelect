#! /usr/local/bin/perl

use strict;
use warnings;
use Algorithm::MedianSelect qw(median);

my (@num_items, @char_items);

@num_items  = qw(1 2 3 5 6 7 9 12 14 19 21);
@char_items = qw(abcdefgh bc def ghij klm pqrstu vwxyz);

print median( \@num_items ),"\n";
