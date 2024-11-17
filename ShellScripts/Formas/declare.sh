clear
declare -A vehiculos
vehiculos=([coche]='20€ / km' [furgoneta] = '10€ / km' [bicicleta]='5€ / km')
while : 
do
    clear

    echo -e "\tcoche"
    echo -e "\tfurgoneta"
    echo -e "\tbicicleta"
    read -p "Vehículo a alquilar: " opcion
    case $opcion in
        coche)
            echo -e "\tPrecio: ${vehiculos[coche]}" ;;
        furgoneta)
            echo -e "\tPrecio: ${vehiculos[furgoneta]}" ;;
        bicicleta)
            echo -e "\tPrecio: ${vehiculos[bicicleta]}" ;;
        salir)
            echo -e "\tSaliendo" 
            exit ;;
        *)
            echo -e "\tOpción no valida" ;;
    esac
    sleep 2
done