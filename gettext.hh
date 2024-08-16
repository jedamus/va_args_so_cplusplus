/* -*- C -*- */
/* gettext.hh */
/* erzeugt Montag, 25. November 2019 06:45 (C) 2019 von Leander Jedamus */
// modifiziert Dienstag, 15. August 2023 16:04 von Leander Jedamus
/* modifiziert Montag, 25. November 2019 06:54 von Leander Jedamus */

#ifndef GETTEXT_HH
#define GETTEXT_HH 1

#ifdef FIRST_STEP

#define _(String) (String)
#define N_(String) String
#define textdomain(Domain)
#define bindtextdomain(Package, Directory)

#else

#include <libintl.h>
#define _(String) gettext (String)
#define gettext_noop(String) String
#define N_(String) gettext_noop (String)

#endif

#endif /* GETTEXT_HH */

/* vim:set cindent ai sw=2 */

