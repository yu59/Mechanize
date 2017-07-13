use strict;
use warnings;
use WWW::Mechanize;
use WWW::Mechanize::TreeBuilder;
use utf8;
use Encode;

my $mech = WWW::Mechanize->new();
# WWW::Mechanizeを呼び出した後に次のようにする
WWW::Mechanize::TreeBuilder->meta->apply($mech);

$mech->get('http://www.cpan.org');

$mech->submit_form(
    fields =>  { q => 'tokuhirom' } # sbtc lst-ib
);



print encode('utf8',$mech->content);

# $mech->parse($mech->content);
# encode('utf8',$mech->content);

# my @items = $mech->lookdown('id', 'cpansearch')->find('h2');
# print $_->as_text . "\n" for @items;

# my $tree = HTML::TreeBuilder->new();
# my $url = 'http://www.yahoo.co.jp';#www.cpan.org
# my $user_agent = "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0)";
# my $ua = LWP::UserAgent->new('agent' => $user_agent);
# my $res = $ua->get($url);
# my $content = $res->content;
# $tree->parse($content);

# my @items= $tree->look_down('id', 'topicsfb')->find('li');
# print $_->as_text . "\n" for @items;
