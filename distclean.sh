#!/usr/bin/env sh

# erzeugt Mittwoch, 16. August 2023 14:52 (C) 2023 von Leander Jedamus
# modifiziert Donnerstag, 17. August 2023 09:18 von Leander Jedamus
# modifiziert Mittwoch, 16. August 2023 14:57 von Leander Jedamus

locale=locale

echo "removing $*"
rm -f $*
if [ -d $locale ]; then
  ( cd $locale;
    for i in *; do
      if [ -d $i ]; then
        echo "removing $locale/$i"
        rm -rf $i
      fi
    done
  )
fi

# vim:ai sw=2

