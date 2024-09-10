// This may look like C code, but it is really -*- C++ -*-
// main.cc
// erzeugt Mittwoch, 19. Juli 2023 18:51 (C) 2023 von Leander Jedamus
// modifiziert Dienstag, 10. September 2024 09:12 von Leander Jedamus
// modifiziert Freitag, 23. Februar 2024 10:34 von Leander Jedamus
// modifiziert Donnerstag, 22. Februar 2024 17:44 von Leander Jedamus
// modifiziert Montag, 02. Oktober 2023 09:03 von Leander Jedamus
// modifiziert Montag, 25. September 2023 07:40 von Leander Jedamus
// modifiziert Mittwoch, 20. September 2023 11:54 von Leander Jedamus
// modifiziert Dienstag, 19. September 2023 17:40 von Leander Jedamus
// modifiziert Samstag, 09. September 2023 08:44 von Leander Jedamus
// modifiziert Freitag, 08. September 2023 17:33 von Leander Jedamus
// modifiziert Samstag, 02. September 2023 11:14 von Leander Jedamus
// modifiziert Donnerstag, 31. August 2023 05:03 von Leander Jedamus
// modifiziert Mittwoch, 30. August 2023 19:06 von Leander Jedamus
// modifiziert Montag, 28. August 2023 08:31 von Leander Jedamus
// modifiziert Dienstag, 15. August 2023 16:56 von Leander Jedamus
// modifiziert Mittwoch, 26. Juli 2023 08:28 von Leander Jedamus
// modifiziert Mittwoch, 19. Juli 2023 18:58 von Leander Jedamus

#include <iostream>
#include <stdlib.h>
#include <string.h>

#include "project.hh"
#include "version.hh"
#include "types.hh"
#include "min.hh"
#include "max.hh"
#include "getlocaledir.hh"
#include "gettext.hh"
#include "clrscr.hh"

#define EPSILON 1E-9
#include "macros.hh"

#if defined __unix__ || defined __APPLE__
#include "getch.hh"
#elif defined __WIN32__ || defined _MSC_VER || defined __MS_DOS__
  #include <conio.h>
#endif

#define MAX 0
#define MIN 1

/*
INLINE char sgn2(RUECKGABE value) {
  if (value>0) {
    return '+';
  } else if (value == 0) {
    return ' ';
  } else {
    return '\0';
  }
}
*/

int main(int argc, char *argv[]) {
  RUECKGABE zahl,rmax,rmin;
  char      *localedir = getlocaledir(argv[0]);
  RUECKGABE (*ptr[])(CONST ull zahlen, ...) = { max, min };
  int       zeichen;
  char      buffer[256];
#ifdef DEBUG
  double    value1 = 0.1;
  double    value2 = 0.00000000001;
#endif

#ifdef CLRSCR
  clrscr();
#endif

  setlocale(LC_ALL, "");
  bindtextdomain(PROJECT, localedir);
  textdomain(PROJECT);

  sprintf(buffer, _("%s V%s (C) %s by %s <%s>"), PROJECT, VERSION, YEARS, AUTHOR, AUTHOR_EMAIL);
  std::cout << buffer << std::endl;
  if (strlen(MAINTAINER) > 0) {
    sprintf(buffer, _("maintained by %s <%s>"), MAINTAINER, MAINTAINER_EMAIL);
    std::cout << buffer << std::endl;
  };
  if (strlen(LICENSE) > 0) {
    sprintf(buffer, _("published under license \"%s\""), LICENSE);
    std::cout << buffer << std::endl;
  };


#ifdef DEBUG
  std::cout << localedir << std::endl;
#endif

#ifdef DEBUG
  std::cout << value1 << "?" << value2 << ":" << double_sgn(value1 - value2) << (value1 - value2) << std::endl;
#endif

  std::cout << "MIN=" << sgn(RUECKGABE_MIN) << RUECKGABE_MIN << std::endl;
  std::cout << "MAX=" << sgn(RUECKGABE_MAX) << RUECKGABE_MAX << std::endl;
  std::cout << _("Enter a number: ");
  std::cin >> zahl;
  std::cout << zahl << std::endl;
  
  rmax = (*ptr[MAX]) ((ull) zahl,7ULL,2ULL,3ULL,9ULL,8ULL,(ull) RUECKGABE_MIN);
  std::cout << std::endl;
  rmin = (*ptr[MIN]) ((ull) zahl,7ULL,2ULL,3ULL,9ULL,8ULL,(ull) RUECKGABE_MAX);

  std::cout << "max=" << rmax << ",min=" << rmin << std::endl;

  std::cout << _("Please press 'q' to end program!") << std::endl;
  while ((zeichen=getch()) != 'q');

  return EXIT_SUCCESS;
}

// vim:cindent ai sw=2

