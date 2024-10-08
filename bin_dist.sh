#!/usr/bin/env sh

# erzeugt Freitag, 04. Oktober 2024 19:01 (C) 2024 von Leander Jedamus
# modifiziert Dienstag, 08. Oktober 2024 06:33 von Leander Jedamus
# modifiziert Freitag, 04. Oktober 2024 22:17 von Leander Jedamus

set -e

if [ -z $2 ]; then
  echo "you must provide a program name and then some shaed libraries."
  exit 1
fi

export TRANSLATE="${TRANSLATE:-"de en"}"

PROGRAM=$1
PROJECT=$2
shift
shift

TARFILE="${PROGRAM}_$(uname -s)_$(uname -m).tar.gz"

dir=$(mktemp -d)
filename="install.sh"
filename2="README.txt"
locale=locale

trap "rm -rf $dir; exit" EXIT

mkdir -p $dir/$PROGRAM
cp -vp $PROGRAM $* $dir/$PROGRAM

if [ -d $locale ]; then
  for lang in $TRANSLATE; do
    if [ -d $locale/$lang ]; then
      mkdir -p $dir/$PROGRAM/$locale/$lang/LC_MESSAGES
      cp -vp $locale/$lang/LC_MESSAGES/$PROJECT.mo $dir/$PROGRAM/$locale/$lang/LC_MESSAGES
    fi
  done
fi

FILE=$dir/$PROGRAM/$filename
FILE2=$dir/$PROGRAM/$filename2

if [ -z "$*" ]; then
  libs=""
  ldconfig=""
else
  libs="install -v -m 755 $* \$LIBDIR"
  ldconfig="ldconfig"
fi

cat <<EOF > $FILE
#!/usr/bin/env sh

# erzeugt Freitag, 04. Oktober 2024 19:01 (C) 2024 von Leander Jedamus
# modifiziert Dienstag, 08. Oktober 2024 06:32 von Leander Jedamus
# modifiziert Freitag, 04. Oktober 2024 19:24 von Leander Jedamus

set -e

if [ -z \$1 ]; then
  PREFIX=/usr/local
else
  PREFIX=\$1
fi

locale=locale

BINDIR=\$PREFIX/bin
LIBDIR=\$PREFIX/lib
DATADIR=\$PREFIX/share
LOCALEDIR=\$DATADIR/\$locale

install -v -m 755 $PROGRAM \$BINDIR
$libs

for lang in $TRANSLATE; do
  dir=\$LOCALEDIR/\$lang/LC_MESSAGES
  mkdir -vp \$dir
  install -v -m 644 \$locale/\$lang/LC_MESSAGES/$PROJECT.mo \$dir
done

$ldconfig

# vim:ai sw=2

EOF

chmod +x $FILE

cat <<EOF > $FILE2
Getting started:

To install under /usr/local, do the following:

tar xvfz $TARFILE
cd $PROGRAM
sudo ./install.sh /usr/local
EOF

chmod 644 $FILE2

echo "creating $TARFILE"
( cd $dir; tar cf - $PROGRAM) | gzip -9c > $TARFILE

# vim:ai sw=2

