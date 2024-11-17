#!/bin/bash

read -p "Intoduce el nombre de un archivo para contar la frecuencia de palabras: " archivo

if [ -f $archivo ]; then
    grep -o -E "\w+" $archivo | sort | uniq -c
else
    echo "archivo no encontrado"
fi