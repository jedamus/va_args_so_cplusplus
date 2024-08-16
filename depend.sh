#!/usr/bin/env sh

# erzeugt Sonntag, 30. Juli 2023 17:37 (C) 2023 von Leander Jedamus
# modifiziert Mittwoch, 15. November 2023 16:33 von Leander Jedamus
# modifiziert Dienstag, 08. August 2023 05:53 von Leander Jedamus
# modifiziert Sonntag, 30. Juli 2023 18:28 von Leander Jedamus

# echo "# automatically created $(DATETIME) by \"make depend\"" > $@ \

#set -x 

DATETIME=$(date +"%d.%m.%Y %H:%M")
FILE=$1
IS_IN_LIB=$2
LIBCOMMAND="$3"
OTHERCOMMAND="$4"

for i in $IS_IN_LIB; do 
  if [ "$FILE" = "$i" ]; then 
   echo $LIBCOMMAND
   sh -c "$LIBCOMMAND"
   found=true ;
  fi ; 
  done ; 
  if [ -z $found ]; then 
   echo $OTHERCOMMAND
    sh -c "$OTHERCOMMAND"
  fi

echo "# automatically created $DATETIME by \"make depend\"" >> $FILE

# vim:ai sw=2

