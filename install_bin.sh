#!/usr/bin/env sh

# erzeugt Dienstag, 01. Oktober 2024 06:17 (C) 2024 von Leander Jedamus
# modifiziert Dienstag, 01. Oktober 2024 06:23 von Leander Jedamus

BINDIR=$1
shift

install -v -m 755 $* $BINDIR

# vim:ai sw=2

