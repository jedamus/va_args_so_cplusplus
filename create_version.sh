#!/usr/bin/env sh

# erzeugt Freitag, 16. Februar 2024 19:38 (C) 2024 von Leander Jedamus
# modifiziert Freitag, 16. August 2024 09:02 von Leander Jedamus
# modifiziert Donnerstag, 15. August 2024 16:53 von Leander Jedamus
# modifiziert Montag, 12. August 2024 16:25 von Leander Jedamus
# modifiziert Dienstag, 06. August 2024 14:50 von Leander Jedamus
# modifiziert Freitag, 23. Februar 2024 13:35 von Leander Jedamus
# modifiziert Donnerstag, 22. Februar 2024 08:38 von Leander Jedamus
# modifiziert Sonntag, 18. Februar 2024 09:22 von Leander Jedamus
# modifiziert Freitag, 16. Februar 2024 20:24 von Leander Jedamus

# set -x

if [ -z $1 ]; then
  echo "error: missing parameter to create header file"
  exit 1
fi

filename=$1
if [ -z $2 ]; then
  base_filename=$(basename $filename)
else
  base_filename=$2
fi

version_filename=version.txt
author_filename=author.txt

for file in $version_filename $author_filename; do
  if [ ! -f $file ]; then
    echo "$file not found."
    exit 1
  fi
done

author=$(cat $author_filename)
version=$(cat $version_filename)

# FILENAME=$(echo $filename | sed -e 's/\./_/' | tr a-z A-Z)
FILENAME=$(echo $base_filename | sed -e 's/\./_/g' | tr [:lower:] [:upper:])
YEAR=$(date +"%Y")
DATETIME=$(date +"%A, %d. %B %Y %H:%M")

if [ ! -f $inputfilename ]; then
  echo "$inputfilename not found."
  exit 1
fi

cat <<EOF > $filename
/* -*- C -*- */
/* $base_filename */
/* erzeugt $DATETIME (C) $YEAR von $author */
/* modifiziert $DATETIME von $author */

#ifndef $FILENAME
#define $FILENAME 1

#define VERSION "$version"

#endif /* $FILENAME */

/* vim:set cindent ai sw=2 */

EOF

# vim:ai sw=2

