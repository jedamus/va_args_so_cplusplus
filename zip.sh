#!/usr/bin/env sh

# erzeugt Donnerstag, 02. November 2023 22:07 (C) 2023 von Leander Jedamus
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

if [ -d $svn ]; then
  cp -rp $svn $backup/$BACKUPDIR
  DIRS="$DIRS $BACKUPDIR/$svn"
fi

if [ -d $git ]; then
  cp -rp $git $backup/$BACKUPDIR
  DIRS="$DIRS $BACKUPDIR/$git"
fi

if [ -d $locale ]; then
  cp -rp $locale $backup/$BACKUPDIR
  DIRS="$BACKUPDIR/$locale"
fi

actual_dir=$(pwd)

cd $backup
echo "creating zip-file \"$ZIPFILE\"."

if [ ! -z $DIRS ]; then
  zip -r $ZIPFILE $DIRS
fi

zip $ZIPFILE $BACKUPDIR/*

mv $ZIPFILE $actual_dir
cd ..

# vim:ai sw=2

