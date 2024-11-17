#! /bin/bash
#Calcula el mayor de dos numeros pasados como parámetro

clear
read -p "Dime el primer número a comparar: " numero
read -p "Dime el segundo número a comparar: " numero2


if [ $numero -lt $numero2 ]; then
    echo "$numero es mayor que $numero2"
elif [ $numero -gt $numero2 ]; then
    echo "$numero2 es mayor que $numero"
elsetamano
tamano
    echo "Los números son iguales"
fi