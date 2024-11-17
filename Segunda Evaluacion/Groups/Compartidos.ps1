if (Get-LocalUser -Name Consulta -ErrorAction SilentlyContinue) {
} else {
    New-LocalUser -Name Consulta -NoPassword 
    New-LocalUser -Name Modifica -NoPassword 
    Add-LocalGroupMember -Group "invitados" -Member Consulta
    Add-LocalGroupMember -Group "invitados" -Member Modifica
}

if (Test-Path C:\COMPARTIR -PathType Container) {
} else {
   New-Item -Path C:\COMPARTIR -ItemType Directory
}
 
# CREAR EL RECURSO COMPARTIDO
New-SmbShare -Name "DATOS" -Path "C:\COMPARTIR"

Grant-SmbShareAccess -Name "DATOS" -AccountName "Consulta" -AccessRight Read
Grant-SmbShareAccess -Name "DATOS" -AccountName "Modifica" -AccessRight Change