#PowerShell Adrian
while($true){
Clear-Host
    Write-Host MENU
    Write-Host -------------------------------------------
    Write-Host      1. Listar los usuarios del sistema
    Write-Host      2. Crear usuario
    Write-Host      3. Cambiar contraseña de un usuario
    Write-Host      4. Desactivar usuario
    Write-Host      5. Borrar usuario
    Write-Host      6. Listar los grupos de usuarios del sistema
    Write-Host      7. Listar miembros de un grupo
    Write-Host      8. Crear grupo
    Write-Host      9. Borrar grupo
    Write-Host      10. Añadir usuario a grupo
    Write-Host      11. Borrar usuario de un grupo
    Write-Host      12. Salir
    Write-Host -------------------------------------------

    $op = Read-Host "Dime el numero"
    Clear-Host

    switch ($op){
        "1"{
            Get-LocalUser | Select-Object Name
            Read-Host
            
        }
        "2"{
            $nom = Read-Host "Dime el nombre"
            $Pass = Read-Host -AsSecureString 
            New-LocalUser -Name $nom -Password $Pass
            Add-LocalGroupMember -Group "Usuarios" -Member $nom
            Write-Host "Usuario creado"
            Read-Host
            
        }
        "3"{
             $nom = Read-Host "Dime el nombre"
             $Pass = Read-Host -AsSecureString  
             Set-LocalUser -Name $nom -Password $Pass
             Write-Host "Contraseña cambiada"
             Read-Host
             
        }
        "4"{
            $nom = Read-Host "Dime el nombre"
            Disable-LocalUser -Name $nom
            Write-Host "Usuario deshabilitado"
            Read-Host
            
        }
        "5"{
            $nom = Read-Host "Dime el nombre"
            Remove-LocalUser -Name $nom
            Write-Host "Usuario eliminado"
            Read-Host
            
        }
        "6"{
             Get-LocalGroup
             Read-Host
        }
        "7"{
             $nom = Read-Host "Dime el nombre del grupo"
             Get-LocalGroupMember -Name $nom
             Read-Host
             
             
        }
        "8"{
             $nom = Read-Host "Dime el nombre del grupo"
             New-LocalGroup -Name $nom
             Write-Host "Grupo creado"
             Read-Host
             
        }
        "9"{
             $nom = Read-Host "Dime el nombre del grupo"
             Remove-LocalGroup -Name $nom
             Write-Host "Grupo borrado"
             Read-Host
             
        }
        "10"{
             $nom = Read-Host "Dime el nombre del miembro"
             $gr = Read-Host "Dime el nombre del grupo"
             Add-LocalGroupMember -Group $gr -Member $nom
             Write-Host "Usuario añadido"
             Read-Host
             
        }
        "11"{
             $nom = Read-Host "Dime el nombre del miembro"
             $gr = Read-Host "Dime el nombre del grupo"
             Remove-LocalGroupMember -Group $gr -Member $nom
             Write-Host "Usuario eliminado del grupo"
             Read-Host
             
        }
        "12"{
             exit
        }
        default {
        Write-Host "Opcion no valida"
        }
  }
}