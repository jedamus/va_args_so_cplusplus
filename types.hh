// This may look like C code, but it is really -*- C++ -*-
// types.hh
// erzeugt Mittwoch, 19. Juli 2023 18:38 (C) 2023 von Leander Jedamus
// modifiziert Donnerstag, 05. September 2024 06:42 von Leander Jedamus
// modifiziert Montag, 25. September 2023 07:39 von Leander Jedamus
// modifiziert Dienstag, 19. September 2023 18:31 von Leander Jedamus
// modifiziert Dienstag, 05. September 2023 08:09 von Leander Jedamus
// modifiziert Dienstag, 29. August 2023 10:18 von Leander Jedamus
// modifiziert Mittwoch, 26. Juli 2023 08:29 von Leander Jedamus
// modifiziert Mittwoch, 19. Juli 2023 18:41 von Leander Jedamus

#ifndef TYPES_HH
#define TYPES_HH 1

#include <inttypes.h>
#include <stdbool.h>

typedef unsigned char byte;
typedef unsigned char uchar;

typedef unsigned int uint;
typedef signed int   sint;

typedef unsigned long long ull;
#define PRIull "llu"
#define SCNull "llu"
typedef signed long long   sll;
#define PRIsll "+lld"
#define SCNsll "lld"

// typedef unsigned long int  ulint;
typedef int_least32_t      ulint;
#define PRIulint           PRIdLEAST32
#define SCNulint           SCNdLEAST32

// typedef signed long int    slint;
typedef int_least32_t      slint;
#define PRIslint           PRIdLEAST32
#define SCNslint           SCNdLEAST32

typedef unsigned short int usint;
typedef signed short int   ssint;

#if defined __unix__ || defined __APPLE__
  #define PATH_SEPARATOR ':'
  #define PATH_DELIMITER '/'
  #define PATH_DELIMITER2 "/"
#else
  #define PATH_SEPARATOR ';'
  #define PATH_DELIMITER '\\'
  #define PATH_DELIMITER2 "\\"
#endif

#endif // TYPES_HH

// vim:cindent ai sw=2

