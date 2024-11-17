#!/bin/bash

#Actividad práctica, simulacro de examen
#Para tratar las noticias
for file in noticias*.txt
do
    while IFS="$" read -r ID FECHA TITULO AUTOR TEXTO
    do
        TITULOM=$(echo "$TITULO" | tr 'a-z' 'A-Z')
        #TITULOM=$(echo "$TITULO" | tr '[:lower:]' '[:upper:]')
        echo "$ID"\$"$FECHA"\$"$TITULO"\$"$AUTOR"\$"$TEXTO" > $file
    done < "$file"
done