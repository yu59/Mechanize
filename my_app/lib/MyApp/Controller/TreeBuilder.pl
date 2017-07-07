# http://dqn.sakusakutto.jp/2010/06/perlhtml.html
#! /usr/bin/perl 
use strict;
use warnings;
use Data::Dumper;
use LWP::UserAgent;
use HTML::TreeBuilder;

# my $url = 'http://www.yahoo.co.jp';
my $url = 'http://search.cpan.org/search?query=tokuhirom&mode=all';

my $user_agent = "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0)";

my $ua = LWP::UserAgent->new('agent' => $user_agent);
my $res = $ua->get($url);
my $content = $res->content;

# 解析
my $tree = HTML::TreeBuilder->new;
$tree->parse($content);

# <div id='topicsfb'>だけとりだす
# my @items = $tree->look_down('id', 'topicsfb')->find('li');
my @items = $tree->look_down('id', 'cpansearch')->find('a');
print $_->as_text . "\n" for @items;

