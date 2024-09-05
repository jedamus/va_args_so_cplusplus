// This may look like C code, but it is really -*- C++ -*-
// clrscr.hh
// erzeugt Mittwoch, 30. August 2023 12:02 (C) 2023 von Leander Jedamus
// modifiziert Donnerstag, 05. September 2024 05:38 von Leander Jedamus
// modifiziert Montag, 02. Oktober 2023 07:07 von Leander Jedamus
// modifiziert Donnerstag, 31. August 2023 11:15 von Leander Jedamus
// modifiziert Mittwoch, 30. August 2023 13:39 von Leander Jedamus


#ifndef CLRSCR_HH
#define CLRSCR_HH 1

#include <stdio.h>

#if defined __unix__ || defined __APPLE__
  #define clrscr() printf("\ec")
/*  #define clrscr() printf("\e[2J") */
/*  #define clrscr() system("clear") */
/*  #include <ncurses.h>
  #define clrscr() clear() */
#elif __BORLANDC__ && __MSDOS__
  #include <conio.h>
#elif __WIN32__ || _MSC_VER
  #define clrscr() system("cls")
#else
  #define clrscr() printf("clrscr() - fehlerhafte Implementierung!\n")
#endif

#endif // CLRSCR_HH

// vim:cindent ai sw=2

