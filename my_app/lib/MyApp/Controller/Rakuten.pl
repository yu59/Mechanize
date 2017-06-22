#!/usr/env/perl perl
use strict;
use warnings;
use LWP::Protocol::https;

use WWW::Mechanize;
my $mech = new WWW::Mechanize( autocheck => 1 );


$mech->get("https://www.rakuten.co.jp/myrakuten/login.html");

print $mech->content();

