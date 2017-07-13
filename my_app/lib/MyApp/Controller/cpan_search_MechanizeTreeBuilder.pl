use strict;
use warnings;
use WWW::Mechanize;
use WWW::Mechanize::TreeBuilder;
use utf8;
use Encode;
use LWP::UserAgent;

my $mech = WWW::Mechanize->new();
# WWW::Mechanizeを呼び出した後に次のようにする
WWW::Mechanize::TreeBuilder->meta->apply($mech);

$mech->get('http://search.cpan.org/');
$mech->submit_form( 
	fields => {  q => 'tokuhirom' } 
);
my @list = $mech->look_down("id" => "cpansearch")->find('h2');
print $_->as_text . "\n" for @list;

