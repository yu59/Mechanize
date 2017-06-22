#!/usr/env/perl perl
use strict;
use warnings;
use LWP::Protocol::https;

use WWW::Mechanize;
my $mech = new WWW::Mechanize( autocheck => 1 );


# $mech->get("https://twitter.com/");
$mech->get('https://twitter.com/search-advanced?lang=ja');

$mech->submit_form(
	field
);


