#ifndef _SOURCEVIEW2_PERL_H_

#include <gtk2perl.h>

#include <gtksourceview/gtksourcebuffer.h>
#include <gtksourceview/gtksourceiter.h>
#include <gtksourceview/gtksourcelanguage.h>
#include <gtksourceview/gtksourcelanguagemanager.h>
#include <gtksourceview/gtksourcemark.h>
#include <gtksourceview/gtksourceprintcompositor.h>
#include <gtksourceview/gtksourcestyle.h>
#include <gtksourceview/gtksourcestylescheme.h>
#include <gtksourceview/gtksourcestyleschememanager.h>
#include <gtksourceview/gtksourceview.h>
#include <gtksourceview/gtksourceview-typebuiltins.h>

#include "gtk2-sourceview2-autogen.h"


/**
 * Returns a gchar** in the stack.
 */
#define sourceview2perl_return_strv(list) \
do {\
	if ((list) == NULL) { \
		XSRETURN_EMPTY; \
	} \
	else { \
		size_t i = 0; \
		for (; (list)[i] != NULL ; ++i) { \
			SV *sv = newSVGChar((list)[i]); \
			XPUSHs(sv_2mortal(sv)); \
		} \
	} \
} while (FALSE)

#endif /* _SOURCEVIEW2_PERL_H_ */
