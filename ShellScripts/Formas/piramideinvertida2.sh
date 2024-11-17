#!/bin/bash
#no funciona
clear
n=$1
for((i=1; i<$n;i++)); do
    espacios=$((n-i))
    for((j=1; j<=$espacios;j++)); do
        echo -n "*"
    done
    for((j=1; j<=i; j++)); do
    echo -n "*"
    done
done