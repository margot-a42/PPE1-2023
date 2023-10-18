#!/bin/bash

repertoire="/Users/margot/Documents/Fichiers/Documents/ann"

fichiers_et_dossiers=$(find "$repertoire" -mindepth 1 -maxdepth 1)

annees=$(echo "$fichiers_et_dossiers" | grep -oE '[0-9]{4}')

annees=$(echo "$annees" | cut -c 1-4)

comptage_annees=$(echo "$annees" | sort | uniq -c)

echo "Nombre de fichiers ou dossiers par année :"
echo "$comptage_annees"
