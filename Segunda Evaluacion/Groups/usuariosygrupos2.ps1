# función para la contraseña
function Test-Passwd {
    param (
        [string]$password
    )
    if ($password.Length -lt 8) {
        Write-Host "La contraseña debe tener al menos 8 caracteres."
        return $false
    }
    if ($password -notmatch "[A-Z]") {
        Write-Host "La contraseña debe contener al menos una letra mayúscula."
        return $false
    }

    if ($password -notmatch "[a-z]") {
        Write-Host "La contraseña debe contener al menos una letra minúscula."
        return $false
    }
    if ($password -notmatch "\d") {
        Write-Host "La contraseña debe contener al menos un número."
        return $false
    }
    if ($password -notmatch "[^a-zA-Z0-9]") {
        Write-Host "La contraseña debe contener al menos un carácter especial."
        return $false
    }
    Write-Host "La contraseña cumple con los requisitos de complejidad."
    return $true
}
# función para el menú
function Mostrar-Menu {
    Clear-Host
    Write-Host "Menú de Administración de Usuarios y Grupos"
    Write-Host "1. Listar los usuarios del sistema"
    Write-Host "2. Crear usuario"
    Write-Host "3. Cambiar contraseña de un usuario"
    Write-Host "4. Desactivar usuario"
    Write-Host "5. Borrar usuario"
    Write-Host "6. Listar los grupos de usuarios del sistema"
    Write-Host "7. Listar miembros de un grupo"
    Write-Host "8. Crear grupo"
    Write-Host "9. Borrar grupo"
    Write-Host "10. Añadir usuario a grupo"
    Write-Host "11. Borrar usuario de un grupo"
    Write-Host "12. Salir"
}

while ($true) {
    Mostrar-Menu
    $opcion = Read-Host "Seleccione una opción"

    switch ($opcion) {
        1 { Get-LocalUser}
        2 {
            $password = Test-Passwd
            $usuario = Read-Host "Ingrese el nombre del nuevo usuario"
            New-LocalUser -Name $usuario -Password $password
            Add-LocalGroupMember -Group "Usuarios" -Member $usuario
        }
        3 {
            $usuario = Read-Host "Ingrese el nombre del usuario"
            $nuevaContraseña = Read-Host -AsSecureString "Ingrese la nueva contraseña"
            Set-LocalUser -Name $usuario -Password $nuevaContraseña
        }
        4 {
            $usuario = Read-Host "Ingrese el nombre del usuario a desactivar"
            Disable-LocalUser -Name $usuario
        }
        5 {
            $usuario = Read-Host "Ingrese el nombre del usuario a borrar"
            Remove-LocalUser -Name $usuario
        }
        6 { Get-LocalGroup | Format-Table -AutoSize }
        7 {
            $grupo = Read-Host "Ingrese el nombre del grupo"
            Get-LocalGroupMember -Group $grupo | Format-Table -AutoSize
        }
        8 {
            $grupo = Read-Host "Ingrese el nombre del nuevo grupo"
            New-LocalGroup -Name $grupo
        }
        9 {
            $grupo = Read-Host "Ingrese el nombre del grupo a borrar"
            Remove-LocalGroup -Name $grupo
        }
        10 {
            $usuario = Read-Host "Ingrese el nombre del usuario"
            $grupo = Read-Host "Ingrese el nombre del grupo"
            Add-LocalGroupMember -Group $grupo -Member $usuario
        }
        11 {
            $usuario = Read-Host "Ingrese el nombre del usuario"
            $grupo = Read-Host "Ingrese el nombre del grupo"
            Remove-LocalGroupMember -Group $grupo -Member $usuario
        }
        12 { exit }
        default { Write-Host "Opción no válida. Por favor, seleccione una opción válida." }
    }

    Read-Host "Presione Enter para continuar..."
}
