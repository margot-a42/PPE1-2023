#!/usr/bin/env bash

if [ -n "$1" ]; then
    echo "il y a bien un argument"
else
    echo "il n'y a pas d'argument"
    exit
fi

fichier_urls="$1"
fichier_tsv="tableaux/urls.tsv"

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

done < "$1" > "$fichier_tsv"


# Nom du fichier d'entrée
tableau="$1"

# Nom du fichier de sortie HTML
tableau_html="tableaux/tableau-fr.html"

echo "<html>
<head>
    <title>Conversion TSV vers HTML</title>
</head>
<body>
    <h2>Tableau de donnees</h2>
    <table border='1'>
        <tr>$(awk -F'\t' '{for(i=1;i<=NF;i++)printf("<th>%s</th>",$i); exit}' "$tableau")</tr>" > "$tableau_html"

# Ajouter le corps HTML avec les données
awk -F'\t' '{printf("<tr>"); for(i=1;i<=NF;i++)printf("<td>%s</td>",$i); printf("</tr>\n")}' "$tableau" >> "$tableau_html"

# Ajouter la fin du fichier HTML
echo "    </table>
</body>
</html>" >> "$tableau_html"

echo "Conversion terminée. Le fichier HTML est disponible dans $tableau_html."
