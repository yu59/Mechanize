# http://dqn.sakusakutto.jp/2010/06/perlhtml.html
use strict;
use warnings;
use LWP::UserAgent;
use HTML::TreeBuilder;

my $tree = HTML::TreeBuilder->new();
my $http = HTTP::Lite->new();
my $url = 'https://www.yahoo.co.jp';
my $user_agent = "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0)";
my $ua = LWP::UserAgent->new('agent' => $user_agent);
my $res = $ua->get($url);
my $content = $res->content;
$tree->parse($content);

my @items= $tree->look_down('id', 'topicsfb')->find('li');
print $_->as_text . "\n" for @items;

