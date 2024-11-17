#! /bin/bash
#Triangulo que altera entre A y B en vez de asteriscos
clear
read -p "Dime la altura del triángulo a imprimir: " altura

for ((i=1; i <= $altura; i++)); do
	for(( j=1; j <= i; j++)); do
		if [ $((i % 2)) -eq 0 ]; then
			echo -n "A"
		else
			echo -n "B"
		fi
	done
	echo
done
