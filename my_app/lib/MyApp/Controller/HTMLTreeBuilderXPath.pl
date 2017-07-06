# <'https://www.Rakuten.co.jp/'> でerror
use strict;
use warnings;
use LWP::Simple;
use HTML::TreeBuilder;
use Encode;
use utf8;
binmode(STDERR, ':raw :encoding(utf8)');
use Data::Dumper;

my $url = 'https://www.oreilly.co.jp/catalog/';
my $page = get( $url ) or die $!;
my $p = HTML::TreeBuilder->new_from_content( $page );

# print Dumper $p;

my @links = $p->look_down(
	_tag => 'a',
	href => qr{^ \Qhttps://www.oreilly.co.jp/catalog/\E \w+ / $}x
);

my @rows = map { $_->parent->parent } @links;

my @books;
for my $row (@rows) {
	my %book;
	my @cells = $row->look_down( _tag => 'td' );
	next if ($#cells != 2);
	$book{isbn}		= $cells[0]->as_trimmed_text;
	$book{title}	= decode('utf8', $cells[1]->as_trimmed_text);
	$book{price}	= $cells[2]->as_trimmed_text;
	$book{price}	=~ s/^\\//;
	$book{price}	=~ s/,//g;

	$book{url}		= get_url($cells[1]);
	push @books, \%book;
}

sub get_url {
	my $node = shift;
	my @hrefs = $node->look_down( _tag => 'a' );
	return unless @hrefs;
	my $url = $hrefs[0]->attr('href');
	$url =~ s/\s+$//;
}
$p = $p->delete;

{
	my $count = 1;
	my @perlbooks = sort { $a->{price} <=> $b->{price} }
					grep { $_->{title} =~ /perl/i } @books;
	print $count++, "/t", $_->{price}, "\t", $_->{title}, "\n" for @perlbooks;
}

{
	my @perlbooks = grep { $_->{title} =~ /perl/i } @books;
	my @javabooks = grep { $_->{title} =~ /java/i } @books;
	my $diff = @javabooks - @perlbooks;
	print "Perl本は" . @perlbooks . "冊あり，Java本は" . @javabooks . "冊あります。  Perl本よりもJava本の方が" . $diff . "冊多いです。\n";
}


	
