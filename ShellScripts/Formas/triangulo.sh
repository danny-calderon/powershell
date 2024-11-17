#! /bin/bash
#Triangulo de asteriscos cuya altura se pida como parámetro

clear
read -p "Dime la altura de la que quieres el triangulo: " altura

for (( i=1; i<=$altura; i++ )) do
    for (( j=1; j<=$i; j++ )) do
        echo -n "*"
    done
echo
done
