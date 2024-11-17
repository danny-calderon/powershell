#!/bin/bash
#corregir los errores del siguiente script
#Corregir los errores del siguiente script.
#    for i in *
#    do
#        TEST=who | grep $i`
#        if [ ! "TEST" ]
#        then
#           echo "$I SI esta conectado"
#        else
#            echo "$i NO esta conectado"
#   fi

for i in *
do
    TEST=$(who | grep "$i")
    if [ -n "$TEST" ]
    then
        echo "$i SI esta conectado"
    else
        echo "$i NO esta conectado"
    fi
done