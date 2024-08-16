#!/usr/bin/env sh

# erzeugt Mittwoch, 19. Juli 2023 11:37 (C) 2023 von Leander Jedamus
# modifiziert Dienstag, 06. August 2024 13:54 von Leander Jedamus
# modifiziert Donnerstag, 22. Februar 2024 10:39 von Leander Jedamus
# modifiziert Mittwoch, 08. November 2023 08:11 von Leander Jedamus
# modifiziert Mittwoch, 16. August 2023 15:04 von Leander Jedamus
# modifiziert Sonntag, 30. Juli 2023 12:45 von Leander Jedamus
# modifiziert Mittwoch, 19. Juli 2023 13:09 von Leander Jedamus

my_make() {
  echo "-----------------------------------------------------------------------"
  if [ -z $1 ]; then
    echo "calling \"make\""
  else
    echo "calling \"make $1\""
  fi
  make $1
};# my_make

my_make clean && my_make create_project && my_make backup && my_make translate && my_make zip && my_make

# vim:ai sw=2

