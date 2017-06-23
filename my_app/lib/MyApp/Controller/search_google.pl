use strict;
use warnings;
use WWW::Mechanize;

my $mech = WWW::Mechanize->new();
$mech->get('https://www.google.co.jp');

$mech->submit_form(
	fields =>  { q => 'YAPC' }
);
print $mech->content;
