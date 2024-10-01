#!/usr/bin/env sh

# erzeugt Dienstag, 01. Oktober 2024 06:17 (C) 2024 von Leander Jedamus
# modifiziert Dienstag, 01. Oktober 2024 06:26 von Leander Jedamus

LOCALEDIR=$1
shift

for lang in de en; do
  dir=$LOCALEDIR/$lang/LC_MESSAGES
  mkdir -vp $dir
  install -v -m 644 locale/$lang/LC_MESSAGES/$1 $dir
done


# vim:ai sw=2

