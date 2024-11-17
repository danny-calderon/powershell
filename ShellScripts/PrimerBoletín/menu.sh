#HAZ UN MENÚ QUE QUE LLEVE LOS FICHEROS DE UN DIRECTORIO A OTRO Y LOS COMPRIMA EN UN ZIP
#EL MENÚ DEBE TENER TRES CASOS, EL DE COMPRIMIR, EL DE SALIR Y OTRO CON EL MENSAJE DE "NO HAS ELEGIDO LA OPCIÓN CORRECTA"
#DEBE TENER UN SWITCH CASE PARA CADA CASO
#! /bin/bash

while :
do
    clear 
    echo "Menú de opciones:"
    echo "1. Guardar archivos"
    echo "2.Salir"
    read -p "Selecciona una opción (1/2): " OPCION
    case "$OPCION" in
        1)
            #Obtener la fecha actual
            DATA=$(date +%Y-%m-%d)
            #Solicitar el directorio de origen
            read -p "Introduce la ruta absoluta del directorio donde están lso archivos a guardar: "  DIRORI
            #Solicitar directorio de destino
            read -p "Introduce la ruta absoluta del directorio donde quieres guardar los archivos comprimidos: " DIRDEST
            #Solicitar nombre del archivo tar
            read -p "Introduce el nombre del archivo tar: " NOM

            if [ -d "$DIRORI" ]; then
                if [ ! -d "DIRDEST" ]; then
                    echo "El directorio de destino no existía, creando directorio..."
                    mkdir -p "DIRDEST"
                fi

                #Crear el archivo tar
                tar cvf "$DIRDEST/$NOM-$DATA.tar" "$DIRORI"
                echo "Los archivos se han guardado correctamente en $DIRDEST/$NOM-$DATA.tar"
            else
                echo "!ATENCIÓN: No se ha podido realizar la operación porque el directorio de origen no existe!"
            fi
            ;;
        2)
            echo "Saliendo del programa."
            exit 0
            ;;
        *)
            echo "Opción invalida. Por favor, selecciona 1 o 2."
            ;;
    esac
done