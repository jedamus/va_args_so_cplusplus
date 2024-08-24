#!/usr/bin/env sh

# erzeugt Donnerstag, 02. November 2023 22:07 (C) 2023 von Leander Jedamus
# modifiziert Samstag, 24. August 2024 09:13 von Leander Jedamus
# modifiziert Freitag, 29. Dezember 2023 12:36 von Leander Jedamus
# modifiziert Donnerstag, 28. Dezember 2023 07:13 von Leander Jedamus
# modifiziert Samstag, 16. Dezember 2023 06:39 von Leander Jedamus
# modifiziert Freitag, 15. Dezember 2023 11:36 von Leander Jedamus
# modifiziert Donnerstag, 14. Dezember 2023 13:51 von Leander Jedamus
# modifiziert Mittwoch, 15. November 2023 14:07 von Leander Jedamus
# modifiziert Mittwoch, 08. November 2023 07:34 von Leander Jedamus
# modifiziert Dienstag, 07. November 2023 18:05 von Leander Jedamus
# modifiziert Sonntag, 05. November 2023 08:42 von Leander Jedamus
# modifiziert Samstag, 04. November 2023 22:30 von Leander Jedamus
# modifiziert Donnerstag, 02. November 2023 23:42 von Leander Jedamus

# set -x
set -e

if [ -z $2 ]; then
  echo "error: Please provide a backup-dir and the name of the tarfile and after that some files to backup"
  exit 1
fi

locale=locale
svn=.svn
git=.git
BACKUPDIR=$1
ZIPFILE=$2
backup=$(mktemp -d)
shift
shift
FILES=$*

trap "rm -rf $backup; exit" EXIT

# rm -rf $backup
mkdir -p $backup/$BACKUPDIR
echo "copying files."
cp -p $FILES $backup/$BACKUPDIR

dirs="$svn $git $locale"

for dir in $dirs; do
  if [ -d $dir ]; then
    cp -rvp $dir $backup/$BACKUPDIR
    DIRS="$DIRS $BACKUPDIR/$dir"
  fi
done

actual_dir=$(pwd)

cd $backup
echo "creating zip-file \"$ZIPFILE\"."

if [ ! -z "$DIRS" ]; then
  zip -r $ZIPFILE $DIRS
fi

zip $ZIPFILE $BACKUPDIR/*

mv $ZIPFILE $actual_dir
cd ..

# vim:ai sw=2

