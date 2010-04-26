/*
 * Copyright (c) 2009-2010 by Emmanuel Rodriguez (see the file AUTHORS)
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version; or the
 * Artistic License, version 2.0.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details; or the Artistic License.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307 USA.
 */

#include "gtk2-sourceview2-perl.h"

MODULE = Gtk2::SourceView2::StyleSchemeManager PACKAGE = Gtk2::SourceView2::StyleSchemeManager PREFIX = gtk_source_style_scheme_manager_

GtkSourceStyleSchemeManager*
gtk_source_style_scheme_manager_new (class)
	C_ARGS: /* No args */

GtkSourceStyleSchemeManager*
gtk_source_style_scheme_manager_get_default (class)
	C_ARGS: /* No args */


=for apidoc

Sets the list of directories where the manager looks for style scheme files. If
no dirs are given (empty list) then the search path is cleared, if C<undef> is
passed then the search path is reset to default.

=cut
void
gtk_source_style_scheme_manager_set_search_path (GtkSourceStyleSchemeManager *manager, ...)
	PREINIT:
		gchar **dirs = NULL;
		size_t count = 0;
		size_t i     = 0;

	CODE:
		count = items - 1;
		if (count > 0) {
			if (count == 1 && !SvOK(ST(1))) {
				/* Reset the values to the original list */
				dirs = NULL;
			}
			else {
				dirs = g_new0 (gchar *, items);
				for (i = 0; i < count; ++i) {
					dirs[i] = SvGChar(ST(i + 1));
				}
			}
		}
		else {
			/* Clear the current list */
			dirs = g_new0 (gchar *, 1);
			dirs[1] = NULL;
		}

		gtk_source_style_scheme_manager_set_search_path(manager, dirs);
		g_free(dirs);


void
gtk_source_style_scheme_manager_append_search_path (GtkSourceStyleSchemeManager *manager, const gchar *path)

void
gtk_source_style_scheme_manager_prepend_search_path (GtkSourceStyleSchemeManager *manager, const gchar *path)

void
gtk_source_style_scheme_manager_force_rescan (GtkSourceStyleSchemeManager *manager)

GtkSourceStyleScheme*
gtk_source_style_scheme_manager_get_scheme (GtkSourceStyleSchemeManager *manager, const gchar *scheme_id)


void
gtk_source_style_scheme_manager_get_search_path (GtkSourceStyleSchemeManager *manager)
	PREINIT:
		gchar **list = NULL;

	PPCODE:
		list = (gchar **)gtk_source_style_scheme_manager_get_search_path(manager);
		sourceview2perl_return_strv(list);


void
gtk_source_style_scheme_manager_get_scheme_ids (GtkSourceStyleSchemeManager *manager)
	PREINIT:
		gchar **list = NULL;

	PPCODE:
		list = (gchar **)gtk_source_style_scheme_manager_get_scheme_ids(manager);
		sourceview2perl_return_strv(list);
