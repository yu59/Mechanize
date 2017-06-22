package MyApp::Controller::Example;
use Mojo::Base 'Mojolicious::Controller';
use WWW::Mechanize;



# This action will render a template
sub welcome {
	my $self = shift;
	my $mech = WWW::Mechanize->new();
	$mech->get( 'https://login.yahoo.co.jp/config/login?.src=www&.done=https://www.yahoo.co.jp');


	$mech->follow_link( text => 'Use');

	$mech->submit_form(
		form_name => 'search',
		fields => { id => '', password => '' },
		button => 'ログイン';
	);

	# Render template "example/welcome.html.ep" with message
	$self->render(msg => 'Welcome to the Mojolicious real-time web framework!');
	}

1;
