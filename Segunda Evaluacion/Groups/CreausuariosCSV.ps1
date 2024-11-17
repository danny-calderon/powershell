# Preguntar al usuario el nombre del fichero CSV
# $nombreArchivoCSV = Read-Host "Ingrese el nombre del archivo CSV (ejemplo: usu-senia.csv)"

# Combinar la ruta del archivo CSV
$rutaArchivoCSV = Join-Path $PSScriptRoot "usu-senia.csv"

# Verificar si el archivo CSV existe
if (Test-Path $rutaArchivoCSV) {
    # Importar datos del archivo CSV
    $usuarios = Import-Csv -Path $rutaArchivoCSV

    # Iterar sobre cada usuario y crear cuentas
    foreach ($usuario in $usuarios) {
        # Construir el login del usuario
        $login = ($usuario.NOMBRE.substring(0,3).ToLower() -replace '\s+', '') + $usuario.APELLIDO1.substring(0,3).ToLower() + $usuario.APELLIDO2.substring(0,3).ToLower()

        # Obtener la contraseña del NIA
        $contra = $usuario.NIA

        # Construir el nombre del grupo
        $grupo = $usuario.GRUPO

        #Crear el Grupo
        if (Get-LocalGroup -Name $Grupo -ErrorAction SilentlyContinue) {
        } else {
            New-LocalGroup -Name $grupo
        }

        # Crear el usuario
        New-LocalUser -Name $login -Password (ConvertTo-SecureString -AsPlainText $contra -Force)

        # Asignar el usuario al grupo correspondiente
        Add-LocalGroupMember -Group $grupo -Member $login
        Add-LocalGroupMember -Group usuarios -Member $login

        # Forzar el cambio de contraseña en el próximo inicio de sesión
        Set-LocalUser -Name $login -PasswordNeverExpires $true -UserMayChangePassword 

        Write-Host "Usuario '$login' creado con éxito y asignado al grupo '$grupo'."
    }

    Write-Host "Proceso completado."
} else {
    Write-Host "El archivo CSV no existe en la ruta proporcionada."
}
