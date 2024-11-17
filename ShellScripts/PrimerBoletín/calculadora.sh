#!/bin/bash

clear
echo "Dime la operación que vas a hacer: "
read simb
echo "Dime el primer número de la operación: "
read primer
echo "Dime el segundo número de la operación: "
read segundo

case $simb in 

    +)
    resultado=$(($primer + $segundo))
    echo "El resultado de la suma es $resultado"
    ;;
    -)
    resultado=$(($primer - $segundo))
    echo "El resultado de la resta es $resultado"
    ;;
    /)
    if [ $segundo -eq 0 ]; then
        echo "No se puede dividir por cero"
    else
        resultado=$(($primer / $segundo))
        echo "El resultado de la división es $resultado"
    fi
    ;;
    *)
    resultado=$(($primer * $segundo))
    echo "El resultado de la multiplicación es $resultado"
    ;;
esac