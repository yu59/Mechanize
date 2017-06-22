#!/usr/env/perl perl
use strict;
use warnings;
use LWP::Protocol::https;

use WWW::Mechanize;
my $mech = new WWW::Mechanize( autocheck => 1 );


# https://accounts.google.com/ServiceLogin/signinchooser?elo=1&fl    owName=GlifWebSignIn&flowEntry=ServiceLogin

$mech->get("https://accounts.google.com/signin/v2/identifier?flowName=GlifWebSignIn&flowEntry=ServiceLogin");
# $mech->click(
	# button => 'Use another account',
# );
# $mech->click(); 
$mech->submit_form(
	fields => { id => ''}
);
$mech->submit_form( fields => { password => '' } );

$mech->get("https://mail.google.com/");
$mech->click

