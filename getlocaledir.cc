// This may look like C code, but it is really -*- C++ -*-
// getlocaledir.cc
// erzeugt Montag, 14. August 2023 08:33 (C) 2023 von Leander Jedamus
// modifiziert Donnerstag, 05. September 2024 06:44 von Leander Jedamus
// modifiziert Donnerstag, 07. März 2024 17:04 von Leander Jedamus
// modifiziert Sonntag, 03. März 2024 13:15 von Leander Jedamus
// modifiziert Montag, 26. Februar 2024 15:54 von Leander Jedamus
// modifiziert Samstag, 02. September 2023 11:19 von Leander Jedamus
// modifiziert Donnerstag, 31. August 2023 06:09 von Leander Jedamus
// modifiziert Mittwoch, 30. August 2023 18:25 von Leander Jedamus
// modifiziert Montag, 28. August 2023 09:53 von Leander Jedamus
// modifiziert Dienstag, 15. August 2023 07:43 von Leander Jedamus
// modifiziert Montag, 14. August 2023 08:48 von Leander Jedamus

#include <stdio.h>

#ifndef __USE_MISC
#define __USE_MISC
#endif

#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>

#if defined __linux__
  #include <linux/limits.h>
#elif defined __APPLE__
  #include <sys/syslimits.h>
#endif

#include "types.hh"
#include "getlocaledir.hh"

bool check_file(const char * path, const char * filename) {
  char * filename_with_path = (char *) malloc(PATH_MAX);

  sprintf(filename_with_path, "%s%c%s", path, PATH_DELIMITER, filename);

  if( access(filename_with_path, X_OK) != -1) {
    /* printf("%s found in %s.\n", filename, path); */
    return true;
  } else {
    /* printf("%s not found in %s.\n", filename, path); */
    return false;
  }
}

void check_path(const char * path, char * localedir) {
  char * ptr;

  strncpy(localedir,path,PATH_MAX);

  ptr = (char *) strstr(localedir, PATH_DELIMITER2 "bin");
  // printf("ptr=%s\n", ptr);
  if( ptr != NULL) {
    sprintf(ptr,"%s", PATH_DELIMITER2 "share" PATH_DELIMITER2);
  };
}

char *getlocaledir(CONST char * arg) {
  char   c;
  char * localedir = (char *) malloc(PATH_MAX);
  char * tmp;
  char * ptr;
  char * path;

  localedir = (char *) realpath(arg, localedir);
  if(localedir != NULL) {
    ptr = strrchr(localedir, PATH_DELIMITER);

    if(ptr == NULL) {
      printf("ptr == NULL\n");
    } else {
      ++ptr;
      *ptr = '\0';
    }

    strcat(localedir, "locale");
    return localedir;
  } else {
    path = getenv("PATH");
    while((ptr = strchr(path, PATH_SEPARATOR)) != NULL) {
      c = *ptr;
      *ptr = '\0';
      // printf("subpath=%s\n", path);
      if (check_file(path, arg)) {
	tmp = (char *) malloc(PATH_MAX);
	// printf("found.\n");
	check_path(path, tmp);
	strcat(tmp, "locale");
	// printf("PATH: localedir=\"%s\"\n", localedir);
	// printf("localedir=%s\n", localedir);
	return tmp;
      }
      *ptr = c;
      path = ++ptr;
    }
    /* printf("subpath=%s\n", path); */
    if (check_file(path, arg)) {
      tmp = (char *) malloc(PATH_MAX);
      /* printf("found.\n"); */
      check_path(path, tmp);
      strcat(tmp, "locale");
      return tmp;
    }

    /*
    printf("error string: %s\n", strerror(errno));
    perror("realpath");
    */

    return NULL;
  }
}

/* vim:set cindent ai sw=2: */

