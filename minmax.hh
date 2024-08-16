// This may look like C code, but it is really -*- C++ -*-
// minmax.hh
// erzeugt Mittwoch, 19. Juli 2023 18:39 (C) 2023 von Leander Jedamus
// modifiziert Montag, 02. Oktober 2023 06:27 von Leander Jedamus
// modifiziert Dienstag, 19. September 2023 17:42 von Leander Jedamus
// modifiziert Dienstag, 15. August 2023 14:22 von Leander Jedamus
// modifiziert Mittwoch, 19. Juli 2023 18:59 von Leander Jedamus

#ifndef MINMAX_HH
#define MINMAX_HH 1

#include <limits.h>
#include "types.hh"

// #define SHORT  1
#define LONG  1
#define SIGNED 1

#ifdef SHORT
  #ifdef SIGNED
    #define RUECKGABE    ssint
    #define PRIRUECKGABE "d"
    #define SCNRUECKGABE "hd"
    #define RUECKGABE_MIN SHRT_MIN
    #define RUECKGABE_MAX SHRT_MAX
  #else
    #define RUECKGABE    usint
    #define PRIRUECKGABE "hd"
    #define SCNRUECKGABE "hd"
    #define RUECKGABE_MIN 0
    #define RUECKGABE_MAX USHRT_MAX
  #endif
#else
  #ifdef LONG
    #ifdef SIGNED
      #define RUECKGABE    sll
      #define PRIRUECKGABE PRIslint
      #define SCNRUECKGABE SCNslint
      #define RUECKGABE_MIN LONG_MIN
      #define RUECKGABE_MAX LONG_MAX
    #else
      #define RUECKGABE    ull
      #define PRIRUECKGABE PRIulint
      #define SCNRUECKGABE SCNulint
      #define RUECKGABE_MIN 0
      #define RUECKGABE_MAX ULONG_MAX
    #endif
  #else
    #ifdef SIGNED
      #define RUECKGABE    sint
      #define PRIRUECKGABE "d"
      #define SCNRUECKGABE "d"
      #define RUECKGABE_MIN INT_MIN
      #define RUECKGABE_MAX INT_MAX
    #else
      #define RUECKGABE    uint
      #define PRIRUECKGABE "d"
      #define SCNRUECKGABE "d"
      #define RUECKGABE_MIN 0
      #define RUECKGABE_MAX UINT_MAX
    #endif
  #endif
#endif

#endif // MINMAX_HH

// vim:cindent ai sw=2

