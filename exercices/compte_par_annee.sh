#!/bin/bash

repertoire="/Users/margot/Documents/Fichiers/Documents/ann"

fichiers_et_dossiers=$(find "$repertoire" -mindepth 1 -maxdepth 1)

annees=$(echo "$fichiers_et_dossiers" | grep -oE '[0-9]{4}')

annees=$(echo "$annees" | cut -c 1-4)

comptage_annees=$(echo "$annees" | sort | uniq -c)

echo "Nombre de fichiers ou dossiers par année :"
if [ -n $comptage_annees]
then 
	echo "le premier argument n'est pas vide"
	if [[ $comptage_annees =~bon(jour|soir)]]
	then 
		echo "salut"
	fi
else
	echo "le premier argument est vide"
fi
echo "fin du programme"
