while ($true) {
    Clear-Host

    Write-Host "1. Crear recurso compartido"
    Write-Host "2. Mostrar información de los recursos compartidos"
    Write-Host "3. Mostrar información detallada de un recurso compartido"
    Write-Host "4. Modificar recurso compartido"
    Write-Host "5. Eliminar recurso compartido"
    Write-Host "6. Añadir permiso de usuario a un recurso"
    Write-Host "7. Eliminar permiso de usuario"
    Write-Host "8. Denegar acceso de un usuario"
    Write-Host "9. Desbloquear acceso de un usuario"
    Write-Host "10. Salir"

    $choice = Read-Host "Ingrese el número de la opción deseada"

    switch ($choice) {
        1 {
            $NombreRecurso = Read-Host "Ingrese el nombre del recurso compartido"
            $Ruta = Read-Host "Ingrese la ruta del recurso compartido"
            
            # Crear la carpeta si no existe
            if (-not (Test-Path -Path $Ruta)) {
                New-Item -ItemType Directory -Path $Ruta
            }

            # Crear el recurso compartido
            New-SmbShare -Name $NombreRecurso -Path $Ruta
            Grant-SmbShareAccess -Name $NombreRecurso -AccountName "Everyone" -AccessRight "Read"
            New-Item -ItemType Directory -Path $Ruta Write-Host "Se ha creado el recurso y la carpeta"
        }
        2 {
            Get-SmbShare
            Read-Host "Presione Enter para continuar"
        }
        3 {
            $NombreRecurso = Read-Host "Ingrese el nombre del recurso compartido"
            Get-SmbShare -Name $NombreRecurso
            Read-Host "Presione Enter para continuar"
        }
        4 {
            $NombreRecurso = Read-Host "Ingrese el nombre del recurso compartido a modificar"
            $NuevaDescripcion = Read-Host "Ingrese la nueva descripción del recurso"
            Set-SmbShare -Name $NombreRecurso -Description $NuevaDescripcion
        }
        5 {
            $NombreRecurso = Read-Host "Ingrese el nombre del recurso compartido a eliminar"
            Remove-SmbShare -Name $NombreRecurso -Force
            Write-Host "El recurso compartido ha sido eliminado"
        }
        6 {
            $NombreRecurso = Read-Host "Ingrese el nombre del recurso compartido"
            $Usuario = Read-Host "Ingrese el nombre del usuario"
            $Permiso = Read-Host "Ingrese el permiso (READ, CHANGE, FULL)"
            Grant-SmbShareAccess -Name $NombreRecurso -AccountName $Usuario -AccessRight $Permiso
        }
        7 {
            $NombreRecurso = Read-Host "Ingrese el nombre del recurso compartido"
            $Usuario = Read-Host "Ingrese el nombre del usuario"
            $Permiso = Read-Host "Ingrese el permiso (READ, CHANGE, FULL)"
            Revoke-SmbShareAccess -Name $NombreRecurso -AccountName $Usuario -AccessRight $Permiso
        }
        8 {
            $NombreRecurso = Read-Host "Ingrese el nombre del recurso compartido"
            $Usuario = Read-Host "Ingrese el nombre del usuario"
            Revoke-SmbShareAccess -Name $NombreRecurso -AccountName $Usuario -Force
        }
        9 {
            $NombreRecurso = Read-Host "Ingrese el nombre del recurso compartido"
            $Usuario = Read-Host "Ingrese el nombre del usuario"
            Grant-SmbShareAccess -Name $NombreRecurso -AccountName $Usuario -Force
        }
        10 {
            exit
        }
        default {
            Write-Host "Opción no válida. Inténtelo de nuevo."
        }
    }
}
