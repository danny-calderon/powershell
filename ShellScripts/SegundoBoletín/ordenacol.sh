#!/bin/bash
read -p "Introduce el nombre del archivo csv para ordenar los usuarios: " archivocsv
sort -t ',' -k2 $archivocsv | head -n 10