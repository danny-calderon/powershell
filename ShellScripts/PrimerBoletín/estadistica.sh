#Verificamos si se se está ejecutando correctamente pasadno un directorio como argumento
if [ $# -ne 1 ]
then
    echo "Uso del programa ha de ser: $0 <directorio>"
    exit 1
fi

# inicializamos las variables/contadores para los diferentes tipos de archivos
lectura=0
escritura=0
ejecución=0
sin_lectura=0
sin_escritura=0
sin_ejecucion=0

# Recorremos todos los archivos y directorios dentro del arbol
for -i in `find $1 2>/dev/null 
then
    if [ -r $i ]
    then
        let lectura+=1
    else
        let sin_lectura+=1
    fi

    if [ -w $i ]
    then
        let escritura+=1
    else
        let sin_escritura+=1
    fi

    if [ -x $i ]
    then
        let ejecucion+=1
    else
        let sin_ejecucion+=1
    fi
done

# Mostramos los resultados
echo "Número de archivos con permiso de lectura: $lectura"
echo "Número de archivos con permiso de escritura: $escritura"
echo "Número de archivos con permiso de ejecucion: $ejecucion"
echo "Número de archivos sin permiso de lectura: $sin_lectura"
echo "Número de archivos sin permiso de escritura: $sin_escritura"
echo "Número de archivos sin permiso de ejecucion: $sin_ejecucion"