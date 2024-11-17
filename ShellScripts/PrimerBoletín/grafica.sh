#! /bin/bash
for fichero in "$@"; do
    if [ "$fichero" -lt 1 -a "$fichero" -gt 75 ]; then 
        for 1 in $(seq 1 $fichero);do
            echo -n "*"
        done
        echo
    else
        echo "El argumento $fichero no está dentro del rango"
        exit 1
    fi
done


# dibuja tantos asteriscos en una linea como valor tiene el parametro
for num in $*
do 
    if [ $num -gt 75 ] || [ $num -lt 1 ]
    then
        echo "el valor $num no está entre el 1 y el 75"
    else
        CONT=$num
        while [ $CONT -gt 0 ]
        do
            #echo -n "*"
            echo -e "*\c"
            #let CONT=$CONT-1
            CONT=`expr $CONT - 1`
        done
        echo
    fi
done