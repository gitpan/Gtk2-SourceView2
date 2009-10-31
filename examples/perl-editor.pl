#!/usr/bin/perl

use strict;
use warnings;

use Glib qw(TRUE FALSE);
use Gtk2 '-init';
use Gtk2::SourceView2;
use File::Slurp;

exit main() unless caller;

sub main {
	my ($file) = @ARGV ? @ARGV : (__FILE__);

	my $window = Gtk2::Window->new();
	$window->set_size_request(480, 360);

	my $scroll = Gtk2::ScrolledWindow->new();
	$scroll->set_policy('automatic', 'automatic');
	$scroll->set_shadow_type('in');
	$window->add($scroll);

	my $sourceview = Gtk2::SourceView2::View->new();
	$scroll->add($sourceview);

	$window->signal_connect(delete_event => sub {
		Gtk2->main_quit();
		return TRUE;
	});

	load_file($sourceview, $file);

	$window->show_all();
	Gtk2->main();

	return 0;
}


sub load_file {
	my ($sourceview, $file) = @_;
	my $buffer = $sourceview->get_buffer;

	# Guess the programming language of the file
	my $manager = Gtk2::SourceView2::LanguageManager->get_default;
	my $language = $manager->guess_language($file);
	$buffer->set_language($language);

	# Loading a file should not be undoable.
	my $content = read_file($file);
	$buffer->begin_not_undoable_action();
	$buffer->set_text($content);
	$buffer->end_not_undoable_action();

	$buffer->set_modified(FALSE);
	$buffer->place_cursor($buffer->get_start_iter);
}
