use WWW::Mechanize;

my $mech = WWW::Mechanize->new();
my $url = "https://accounts.google.com/Login";
$mech->get($url);

print $mech->content();
my $result = $mech->submit_form(
	fields => {
		Email => '',
		Passwd => ''
	}
	,button => 'signIn'
	);
# print $result->content();
