#!/bin/bash
#Obtén el mes actual
MES=$(date +%B)

#Lee el archivo de noiticias
while IFS="$" read -r ID FECHA TITULO AUTOR TEXTO
do
    #Cuenta palabras en el texto de la noticia
    PALABRAS=$(echo $TEXTO | wc -w)

    #Escribe el autor, el título y el número de palabras en el archivo palabras-MES.txt
    echo "$AUTOR,$TITULO,$PALABRAS" >> "palabras-$MES.txt"
done < "$1"