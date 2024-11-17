#A PARTIR DE LAS VARIABLES SACA POR PANTALLA LA FECHA DE HOY, EL USUARIO
#Y EN QUE DIRECTORIO NOS ENCONTRAMOS
#! /bin/bash
clear
echo "La fecha de hoy es: $(date + %d/%m/%Y)"
echo "Soy el usuario: $(whoami)"
echo "Me encuentro en el directorio: $(pwd)"

