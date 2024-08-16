// This may look like C code, but it is really -*- C++ -*-
// min.cc
// erzeugt Mittwoch, 19. Juli 2023 19:07 (C) 2023 von Leander Jedamus
// modifiziert Samstag, 02. September 2023 11:13 von Leander Jedamus
// modifiziert Dienstag, 15. August 2023 14:22 von Leander Jedamus
// modifiziert Donnerstag, 10. August 2023 18:50 von Leander Jedamus
// modifiziert Mittwoch, 26. Juli 2023 08:29 von Leander Jedamus
// modifiziert Mittwoch, 19. Juli 2023 19:10 von Leander Jedamus

#include <iostream>
#include <cstdarg>
#include <cstdio>
#include <limits.h>

#include "types.hh"
#include "min.hh"

RUECKGABE min(CONST ull zahlen, ...) {
  std::va_list      args;
  RUECKGABE         min = (RUECKGABE) zahlen;
  ull               varg;

  std::cout << min << ",";
  va_start(args, zahlen);
  while((varg = va_arg(args, ull)) != (ull) RUECKGABE_MAX)
  {
    RUECKGABE arg = (RUECKGABE) varg;
    std::cout << arg << ",";

    if(min > arg) {
      min = arg;
    }
  };
  va_end(args);

  return min;
}

// vim:cindent ai sw=2

