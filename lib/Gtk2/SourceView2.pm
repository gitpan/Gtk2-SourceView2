package Gtk2::SourceView2;

=head1 NAME

Gtk2::SourceView2 - Enhanced source code editor widget 

=head1 SYNOPSIS

	use Glib qw(TRUE FALSE);
	use Gtk2 '-init';
	use Gtk2::SourceView2;
	
	my $window = Gtk2::Window->new();
	my $view = Gtk2::SourceView2->new();
	$window->add($view);
	$window->set_size_request(480, 120);
	$window->show_all();
	
	$window->signal_connect(delete_event => sub {
		Gtk2->main_quit();
		return TRUE;
	});
	
	Gtk2->main();

=head1 DESCRIPTION

Gtk2::SourceView2 is the Perl binding for the C library gtksourceview-2.0. This
is the same widget that's used by gedit, MonoDevelop, Anjuta and several other
projects.

This widget extends the standard GTK+ framework for multiline text editing with
support for configurable syntax highlighting, unlimited undo/redo, UTF-8
compliant caseless searching, printing and other features typical of a source
code editor.

For more information about gtksourceview-2.0 see:
L<http://projects.gnome.org/gtksourceview/>.

=head1 AUTHORS

Emmanuel Rodriguez E<lt>potyl@cpan.orgE<gt>.

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2009 by Emmanuel Rodriguez.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.

=cut

use warnings;
use strict;
use base 'DynaLoader';

use Gtk2;

our $VERSION = '0.05';

sub dl_load_flags { $^O eq 'darwin' ? 0x00 : 0x01 }

__PACKAGE__->bootstrap($VERSION);

1;
