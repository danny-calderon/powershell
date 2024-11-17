#!/bin/bash

# Verificar si el archivo de usuarios existe
if [ ! -f users.txt ]; then
    echo "Archivo 'users.txt' no encontrado"
    exit 1
fi

# Leer el archivo de usuarios línea por línea
while IFS=: read -r username password; do
    # Verificar si el usuario ya existe
    if id -u "${username}" >/dev/null 2>&1; then
        echo "Usuario '${username}' ya existe"
    else
        # Crear el usuario con la contraseña proporcionada
        useradd -m -s /bin/bash "${username}"
        echo "${username}:${password}" | chpasswd
        echo "Usuario '${username}' creado"
    fi
done < users.txt