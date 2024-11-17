#!/bin/bash
#Pedir al usuario que introduzca el nombre de un archivo de texto y cuente las palabras de ese archivo

clear
read -p "Intoduce el nombre del archivo de texto, sin la extensión: " archivo

#si el archivo exsite entonces
if [ -f "$archivo" ]; then
    #la variable palabras las busca en archivo
    palabras=$(wc -w < $archivo)
    echo "El archivo $archivo contiene $palabras palabras"
else
    echo "El archivo que me has proporcionado no existe."
fi