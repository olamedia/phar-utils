#!/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
SCRIPTNAME=$(basename "$SCRIPT")

if [ "$1" != "" ]; then
    PHAR="$1"
    if [ -f $PHAR ]; then
        OUTPUT="${PHAR%.*}"
        CMD="\$phar = new Phar(\"$PHAR\"); \$phar->extractTo(\"$OUTPUT\");"
        `php -r "$CMD"`
        echo "Done"
    else
        echo "$SCRIPTNAME filename"
    fi
else
    echo "$SCRIPTNAME filename"
fi

