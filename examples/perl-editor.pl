#!/usr/bin/perl

use strict;
use warnings;

use Glib qw(TRUE FALSE);
use Gtk2 '-init';
use Gtk2::SourceView2;

exit main();

sub main {
	
	my $window = Gtk2::Window->new();
	my $view = Gtk2::SourceView2::View->new();
	$window->add($view);
	$window->set_size_request(480, 360);
	$window->show_all();
	
	$window->signal_connect(delete_event => sub {
		Gtk2->main_quit();
		return TRUE;
	});
	
	Gtk2->main();
	
	return 0;
}
