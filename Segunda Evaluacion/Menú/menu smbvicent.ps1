param (
    [string]$nombreMenu
)

# Función para pausar la ejecución y esperar la entrada del usuario
function Pausar {
    Read-Host "Presiona Enter para continuar..."
}

# Menú SMB Vicent
do {
    Clear-Host
    Write-Host ("-" * 32) + " $nombreMenu " + ("-" * 32)
    Write-Host "1. Crear recurso compartido (nombre del recurso, path)"
    Write-Host "2. Muestra información de los recursos compartidos"
    Write-Host "3. Muestra información detallada de un recurso. Solicitar el nombre del recurso compartido"
    Write-Host "4. Modificar recurso (pide recurso y descripción y se cambia)"
    Write-Host "5. Eliminar recurso compartido (Pide recurso)"
    Write-Host "6. Añadir permiso de un usuario a un recurso (pide recurso, usuario y permiso)"
    Write-Host "7. Eliminar permiso a un usuario (pide recurso, usuario y permiso)"
    Write-Host "8. Denegar acceso de un usuario a recurso (pide recurso y usuario)"
    Write-Host "9. Desbloquear acceso a recurso (pide recurso y usuario)"
    Write-Host "10. Salir"

    $opcion = Read-Host "Selecciona una opción (1-10)"

    switch ($opcion) {
        1 {
            # Crear recurso compartido
            $nombreRecurso = Read-Host "Ingresa el nombre del recurso compartido"
            $rutaRecurso = Read-Host "Ingresa la ruta del recurso compartido"
            New-SmbShare -Name $nombreRecurso -Path $rutaRecurso -FullAccess "Everyone"
            Write-Host "Recurso compartido creado con éxito."
            Pausar
        }
        2 {
            # Muestra información de los recursos compartidos
            Get-SmbShare | Format-Table -AutoSize
            Pausar
        }
        3 {
            # Muestra información detallada de un recurso
            $nombreRecursoDetallado = Read-Host "Ingresa el nombre del recurso compartido"
            Get-SmbShare -Name $nombreRecursoDetallado | Format-List
            Pausar
        }
        4 {
            # Modificar recurso
            $nombreRecursoModificar = Read-Host "Ingresa el nombre del recurso compartido a modificar"
            $nuevaDescripcion = Read-Host "Ingresa la nueva descripción"
            Set-SmbShare -Name $nombreRecursoModificar -Description $nuevaDescripcion
            Write-Host "Recurso modificado con éxito."
            Pausar
        }
        5 {
            # Eliminar recurso compartido
            $nombreRecursoEliminar = Read-Host "Ingresa el nombre del recurso compartido a eliminar"
            Remove-SmbShare -Name $nombreRecursoEliminar -Force
            Write-Host "Recurso eliminado con éxito."
            Pausar
        }
        6 {
            # Añadir permiso de un usuario a un recurso
            $nombreRecursoPermiso = Read-Host "Ingresa el nombre del recurso compartido"
            $nombreUsuarioPermiso = Read-Host "Ingresa el nombre del usuario al que quieres añadir permisos"
            $permiso = Read-Host "Ingresa el permiso (por ejemplo: Read, Full)"
            Grant-SmbShareAccess -Name $nombreRecursoPermiso -AccountName $nombreUsuarioPermiso -AccessRight $permiso
            Write-Host "Permiso añadido con éxito."
            Pausar
        }
        7 {
            # Eliminar permiso a un usuario
            $nombreRecursoEliminarPermiso = Read-Host "Ingresa el nombre del recurso compartido"
            $nombreUsuarioEliminarPermiso = Read-Host "Ingresa el nombre del usuario al que quieres eliminar permisos"
            $permisoEliminar = Read-Host "Ingresa el permiso a eliminar (por ejemplo: Read, Full)"
            Revoke-SmbShareAccess -Name $nombreRecursoEliminarPermiso -AccountName $nombreUsuarioEliminarPermiso -AccessRight $permisoEliminar
            Write-Host "Permiso eliminado con éxito."
            Pausar
        }
        8 {
            # Denegar acceso de un usuario a recurso
            $nombreRecursoDenegar = Read-Host "Ingresa el nombre del recurso compartido"
            $nombreUsuarioDenegar = Read-Host "Ingresa el nombre del usuario al que quieres denegar acceso"
                        Block-SmbShareAccess -Name $nombreRecursoDenegar -AccountName $nombreUsuarioDenegar
            Write-Host "Acceso denegado con éxito."
            Pausar
        }
        9 {
            # Desbloquear acceso a recurso
            $nombreRecursoDesbloquear = Read-Host "Ingresa el nombre del recurso compartido"
            $nombreUsuarioDesbloquear = Read-Host "Ingresa el nombre del usuario al que quieres desbloquear acceso"
            Unblock-SmbShareAccess -Name $nombreRecursoDesbloquear -AccountName $nombreUsuarioDesbloquear
            Write-Host "Acceso desbloqueado con éxito."
            Pausar
        }
        10 {
            # Salir del menú
            Write-Host "Saliendo del menú..."
        }
        default {
            Write-Host "Opción no válida. Inténtalo de nuevo."
            Pausar
        }
    }
} while ($opcion -ne 10)