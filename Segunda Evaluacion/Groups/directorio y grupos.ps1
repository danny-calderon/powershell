# Nombre del script: carpeta_daw.ps1

# Crear el directorio si no existe
$folderPath = "C:\DAW-SI"
if(!(Test-Path -Path $folderPath ))
{
    New-Item -ItemType directory -Path $folderPath
}

# Crear el grupo profesores si no existe
if(!(Get-LocalGroup -Name "profesores" -ErrorAction SilentlyContinue))
{
    New-LocalGroup -Name "profesores"
}

# Crear el grupo alumnos si no existe
if(!(Get-LocalGroup -Name "alumnos" -ErrorAction SilentlyContinue))
{
    New-LocalGroup -Name "alumnos"
}

# Asignar permisos de escritura al grupo profesores
$acl = Get-Acl $folderPath
$permission = "profesores","FullControl","Allow"
$accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule $permission
$acl.SetAccessRule($accessRule)
Set-Acl $folderPath $acl

# Asignar permisos de lectura al grupo alumnos
$acl = Get-Acl $folderPath
$permission = "alumnos","Read","Allow"
$accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule $permission
$acl.SetAccessRule($accessRule)
Set-Acl $folderPath $acl
