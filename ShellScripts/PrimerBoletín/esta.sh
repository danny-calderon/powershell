#LEE UN LOGIN POR TELCAOD Y COMPRUEBA SI EL USUARIO ESTÁ CONECTADO
#ESCRIBIENDO UN MENSAJE CORRESPONDIENTE
#! /bin/bash
clear
read -p "Introduce un login: " login
if who -u | grep -p "$login"; then
    echo "El usuario $login está conectado al sistema"
else
    echo "El usuario $login no está conectado al sistema"
fi
echo