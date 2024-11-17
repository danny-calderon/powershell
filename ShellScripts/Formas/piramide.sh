#! /bin/bash
#Piramide de asteriscos
clear
read -p "Dime la altura de la pirámide a imprimir: " altura

for ((i=1; i<=$altura; i++)); do
	for ((j=1; j<=$altura -i; j++)); do
		echo -n " "
	done
	for ((y=1; y<=2*i-1; y++)); do
		echo -n "*"
	done
	echo
done