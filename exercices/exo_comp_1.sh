#!/usr/bin/env bash

if [ -n "$1" ]; then
    echo "il y a bien un argument"
else
    echo "il n'y a pas d'argument"
    exit
fi

texte="$1"

cat "$1" | tr ' ' '\n' | grep -v '^$' | tr -d '[:punct:]' | tr '[:upper:]' '[:lower:]'