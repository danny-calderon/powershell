# Preguntar el nombre del fichero csv
$csvFileName = Read-Host "Ingrese el nombre del archivo CSV (incluyendo la extensión):"

# Verificar si el archivo existe
if (-not (Test-Path $csvFileName)) {
    Write-Host "El archivo $csvFileName no existe en el directorio actual."
    exit
}

# Importar datos del archivo CSV
$usuarios = Import-Csv -Path $csvFileName

# Recorrer cada usuario y crear el usuario y grupo correspondiente
foreach ($usuario in $usuarios) {
    # Construir el nombre de usuario
    $nombreUsuario = ($usuario.NOMBRE -split " ")[0].ToLower() + $usuario.APELLIDO1.ToLower()

    # Construir el nombre del grupo
    $nombreGrupo = $usuario.GRUPO

    # Crear el usuario
    New-LocalUser -Name $nombreUsuario -Password $usuario.NIA -Description "Usuario creado automáticamente" -PasswordNeverExpires $true

    # Asignar el usuario al grupo correspondiente
    Add-LocalGroupMember -Group $nombreGrupo -Member $nombreUsuario

    # Forzar el cambio de contraseña la primera vez que el usuario se conecte
    Set-LocalUser -Name $nombreUsuario -PasswordExpired $true
}

Write-Host "Proceso completado. Usuarios y grupos creados según el archivo CSV."
