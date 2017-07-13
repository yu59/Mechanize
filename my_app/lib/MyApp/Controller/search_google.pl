use strict;
use warnings;
use Test::WWW::Mechanize;
# use WWW::Mechanize::TreeBuilder;

my $mech = Test::WWW::Mechanize->new();
# WWW::Mechanize::TreeBuilder->meta->apply($mech);

$mech->get('https://www.google.co.jp');

$mech->submit_form(
	fields =>  { q => 'YAPC' } # sbtc lst-ib
);

print $mech->content;
