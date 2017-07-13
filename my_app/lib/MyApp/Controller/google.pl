use strict;
use 5.010;
use warnings;

use WWW::Mechanize;
use HTML::TreeBuilder::XPath;
use Encode;
use Readonly;

sub say { print @_, "\n";}

my $mech = WWW::Mechanize->new();

$mech->get('https://www.google.co.jp/');
# print $mech->content();

my $res = $mech->submit_form(
	fields => {
		q => 'Perl',
	}
) or die 'submitting failed';

my $tree = HTML::TreeBuilder::XPath->new;
$tree->parse($res->content())
	or die "parsing failed";

my @nodes = $tree->findnodes( '/html/body//div[@class="g"]/a[@class="l"]');

for my $node (@nodes) {
	say encode_utf8(decode('shiftjis',$node->as_text)), '(', $node->attr('href'),')';
}
for my $node (@nodes) {
	say $mech->content('http://www.google.co.jp/');
}

