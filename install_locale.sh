#!/usr/bin/env sh

# erzeugt Dienstag, 01. Oktober 2024 06:17 (C) 2024 von Leander Jedamus
# modifiziert Freitag, 04. Oktober 2024 23:34 von Leander Jedamus
# modifiziert Dienstag, 01. Oktober 2024 06:26 von Leander Jedamus

set -e

export TRANSLATE="${TRANSLATE:-"de en"}"

LOCALEDIR=$1
MOFILE=$2
shift
shift

if [ ! -z "$*" ]; then
  echo "to much parameters!"
  exit 1
fi

for lang in $TRANSLATE; do
  dir=$LOCALEDIR/$lang/LC_MESSAGES
  mkdir -vp $dir
  install -v -m 644 locale/$lang/LC_MESSAGES/$MOFILE $dir
done


# vim:ai sw=2

