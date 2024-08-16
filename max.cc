// This may look like C code, but it is really -*- C++ -*-
// max.cc
// erzeugt Mittwoch, 19. Juli 2023 19:11 (C) 2023 von Leander Jedamus
// modifiziert Samstag, 02. September 2023 11:14 von Leander Jedamus
// modifiziert Dienstag, 15. August 2023 14:22 von Leander Jedamus
// modifiziert Donnerstag, 10. August 2023 18:51 von Leander Jedamus
// modifiziert Mittwoch, 26. Juli 2023 08:28 von Leander Jedamus
// modifiziert Mittwoch, 19. Juli 2023 19:12 von Leander Jedamus

#include <iostream>
#include <cstdarg>
#include <cstdio>
#include <limits.h>

#include "types.hh"
#include "max.hh"

RUECKGABE max(CONST ull zahlen, ...) {
  std::va_list      args;
  RUECKGABE         max = (RUECKGABE) zahlen;
  ull               varg;

  std::cout << max << ",";
  va_start(args, zahlen);
  while((varg = va_arg(args, ull)) != (ull) RUECKGABE_MIN)
  {
    RUECKGABE arg = (RUECKGABE) varg;
    std::cout << arg << ",";

    if(max < arg) {
      max = arg;
    }
  };
  va_end(args);

  return max;
}

// vim:cindent ai sw=2

