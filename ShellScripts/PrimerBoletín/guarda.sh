#COPIA TODOS LOS FICHEROS DEL DIRECTORIO ACTUAL, SI EL DIRECTORIO
#NO EXISTE EL SCRIPT LO DEBE CREAR
#! /bin/bash
clear
if [ "$1" != "" ]; then
    usuario = $1
else
    usuario = $(whoami)
fi
directorio = "$HOME/$usuario/seguridad"
if  [! -d "$directorio" ]; then
    mkdir "$directorio"
fi
cp -R ./*  "$directorio"