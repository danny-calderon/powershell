#!/bin/bash
#Forma un triangulo invertido
clear
read -p "Ingrese la altura del triángulo invertido: " altura

for ((i=altura; i>=1; i--)); do
    for ((j=1; j<=i; j++)); do
        echo -n "*"
    done
    echo
done