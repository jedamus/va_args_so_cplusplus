/* -*- C -*- */
/* getlocaledir.cc */
/* erzeugt Montag, 14. August 2023 08:33 (C) 2023 von Leander Jedamus */
// modifiziert Samstag, 02. September 2023 11:20 von Leander Jedamus
// modifiziert Donnerstag, 31. August 2023 05:37 von Leander Jedamus
/* modifiziert Mittwoch, 30. August 2023 18:34 von Leander Jedamus */
/* modifiziert Montag, 28. August 2023 09:53 von Leander Jedamus */
/* modifiziert Dienstag, 15. August 2023 07:43 von Leander Jedamus */
/* modifiziert Montag, 14. August 2023 08:48 von Leander Jedamus */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#if defined __linux__
  #include <linux/limits.h>
#elif defined __APPLE__
  #include <sys/syslimits.h>
#endif
#include "getlocaledir.hh"

char *getlocaledir(CONST char *arg) {
  char *localedir = (char *) malloc(PATH_MAX);
  char *ptr;

  localedir = (char *) realpath(arg, localedir);

  ptr = strrchr(localedir,'/');
  ++ptr;
  *ptr = '\0';

  strcat(localedir, "locale");

  return localedir;
}

/* vim:set cindent ai sw=2: */

