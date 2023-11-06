#!/usr/bin/env bash

if [ -n "$1" ]; then
    echo "il y a bien un argument"
else
    echo "il n'y a pas d'argument"
    exit
fi

fichier_urls="$1"

N=0
while read -r URL
do
    N=$((N + 1))
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")
	CONTENT_TYPE=$(curl -sI "$URL" | grep -i "Content-Type" | sed 's/.*charset=//')
    
    if [ "$HTTP_CODE" -eq 200 ]; then
        echo -e "$N\t$URL\t$HTTP_CODE\t$CONTENT_TYPE"
    else
        echo -e "$N\t$URL\t$HTTP_CODE"
    fi

done < "$1"