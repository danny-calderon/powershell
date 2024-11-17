#!/bin/bash
#crea una bonoloto que genere 6 números random del 1 al 49 y que no se repitan

#limpiar la pantalla
clear
# array para guardar los números random
declare -a numeros

# bucle menor de 6
for ((i = 0; i < 6; i++))
do
    while true
    do
        # generar el número random
        random=$((RANDOM % 49 + 1))

        # revisar si el número está en el array
        if ! [[ " ${numeros[@]} " =~ " ${random} " ]]
        then
            # meto el número en el array
            numeros+=($random)

            break
        fi
    done
done
numeros_ordenados=($(for i in "${numeros[@]}"; do echo $i; done | sort -n))
echo "Los números generados son: ${numeros_ordenados[@]}"