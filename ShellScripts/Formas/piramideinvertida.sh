#!/bin/bash
#Piramide invertida
clear
read -p "Ingrese la altura del triángulo invertido: " altura

for ((i=altura; i>=1; i--))
do
    for ((j=1; j<=altura-i; j++))
    do
        echo -n " "
    done
    for ((j=1; j<=2*i-1; j++))
    do
        echo -n "*"
    done
    echo
done