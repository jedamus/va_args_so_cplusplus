#!/usr/bin/env sh

# erzeugt Mittwoch, 16. August 2023 12:49 (C) 2023 von Leander Jedamus
# modifiziert Freitag, 15. Dezember 2023 07:23 von Leander Jedamus
# modifiziert Dienstag, 07. November 2023 17:57 von Leander Jedamus
# modifiziert Sonntag, 20. August 2023 14:45 von Leander Jedamus
# modifiziert Donnerstag, 17. August 2023 09:19 von Leander Jedamus
# modifiziert Mittwoch, 16. August 2023 17:10 von Leander Jedamus

# set -x
set -e

locale=locale
svn=.svn
git=.git
BACKUPDIR=$1
TARFILE=$2
backup=$(mktemp -d)
shift
shift
FILES=$*

# echo "backup=$backup"

trap "rm -rf $backup; exit" EXIT

rm -rf $backup
mkdir -p $backup/$BACKUPDIR

if [ -d $locale ]; then
  if [ ! -z "$locale/*.po" ]; then
    echo "copying $locale"
    mkdir -p $backup/$BACKUPDIR/$locale
    cp -p $locale/*.po* $backup/$BACKUPDIR/$locale
  fi
fi

if [ -d $svn ]; then
  cp -rvp $svn $backup/$BACKUPDIR
fi
  
if [ -d $git ]; then
  cp -rvp $git $backup/$BACKUPDIR
fi
  

echo "copying $FILES"
cp -p $FILES $backup/$BACKUPDIR
echo "creating $TARFILE"
( cd $backup; tar cf - $BACKUPDIR) | gzip -9c > $TARFILE

# vim:ai sw=2

