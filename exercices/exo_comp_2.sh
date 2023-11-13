#!/usr/bin/env bash

if [ -n "$1" ]; then
    echo "il y a bien un argument"
else
    echo "il n'y a pas d'argument"
    exit
fi

texte="$1"
nombre_de_mots="${2:-25}"

./exo_comp_1.sh "$1" | sort | uniq -c | sort -nr | head -n "$nombre_de_mots"