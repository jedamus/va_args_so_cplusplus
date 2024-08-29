#!/usr/bin/env sh

# erzeugt Donnerstag, 29. August 2024 08:27 (C) 2024 von Leander Jedamus
# modifiziert Donnerstag, 29. August 2024 08:32 von Leander Jedamus

if [ -z $2 ]; then
  echo "error: You must provide a cpp suffix and a hpp suffix"
  exit 1
fi

CPP=$1
HPP=$2

infile=Makefile.in
outfile=Makefile
for file in $infile; do
  if [ ! -f $file ]; then
    echo "$file not found."
    exit 1
#  else
#    echo "$file found."
  fi
done

sed -e "s/[@]CPP[@]/$CPP/g" \
    -e "s/[@]HPP[@]/$HPP/g" \
    < $infile > $outfile

# vim:ai sw=2

