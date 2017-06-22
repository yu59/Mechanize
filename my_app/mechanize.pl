use warnings;
use strict;
use WWW::Mechanize;

my $mech = WWW::Mechanize->new();
$mech->get( 'https://mail.google.com/' );


$mech->follow_link( text => 'Use');

$mech->submit_form(
    fields => { email => 'e145759@ie.u-ryukyu.ac.jp'},
    button => 'Next';
);

$mech->submit_form(
	fields => { password => 'vtFg2P#J' },
	button => 'Next';
);

$mech->follor_link( text => '作成');

$mech->submit_form(
	fields => { to => 'e145759@gmail.com'},
	button => '送信',
);
$mech->follow_link ( button => 'OK');

	
