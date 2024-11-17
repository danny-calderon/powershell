#!/bin/bash

read -p "Ingrese la altura del cuadrado: " altura

for ((i=1; i<=altura; i++))
do
    for ((j=1; j<=altura; j++))
    do
        echo -n "*"
    done
    echo
done