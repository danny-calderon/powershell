#CREAR UN SCRIPT QUE A PARTIR DE LAS VARIABLES SAQUE POR PANTALLA LA FECHA DE HOY
#EL USUARIO Y EL DIRECTORIO EN EL QUE TE ENCUENTRAS
#! /bin/bash
clear
read -p "Introduce un nombre: " nombre
if grep -p  "$nombre" /etc/passwd; then
    echo "El usuario $nombre existe en el fichero de nombres"
else
    echo "El usuario $nombre no existe en el fichero de nombres"
fi
echo