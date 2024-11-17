#! /bin/bash
# acepta como argumento nombres de ficheros y muestra el contenido de cada uno de ellos precedido de una cabecera con el nombre del fichero

for fich in $*
do
    echo
    echo "contenido del fichero $fich"
    cat $fich
    echo
done