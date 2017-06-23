#!/usr/env/perl perl
use strict;
use warnings;
use WWW::Mechanize;
use LWP::Protocol::https;

my $mech = new WWW::Mechanize( autocheck => 1 );


# $mech->get("https://twitter.com/");
$mech->get('https://twitter.com/search-advanced?lang=ja');

my $result = $mech->submit_form(
	fields => { ands => 'YAPC'}
);
print $mech->content;


