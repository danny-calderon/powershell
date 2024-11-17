# Definir nombres de usuario y permisos
$usuarioMiguel = "Miguel"
$usuarioSara = "Sara"
$contrasenaComun = "Contrasena1234!"  # Contraseña común para ambos usuarios
$recursoCompartido = "APUNTES"
$rutaBase = "C:"
$rutaCarpeta = Join-Path -Path $rutaBase -ChildPath $recursoCompartido

# Crear carpeta si no existe
if (-not (Test-Path $rutaCarpeta)) {
    New-Item -Path $rutaCarpeta -ItemType Directory
}

# Crear usuarios si no existen
if (-not (Get-LocalUser -Name $usuarioMiguel -ErrorAction SilentlyContinue)) {
    New-LocalUser -Name $usuarioMiguel -Password (ConvertTo-SecureString $contrasenaComun -AsPlainText -Force) -Description "Usuario con permisos de escritura"
}

if (-not (Get-LocalUser -Name $usuarioSara -ErrorAction SilentlyContinue)) {
    New-LocalUser -Name $usuarioSara -Password (ConvertTo-SecureString $contrasenaComun -AsPlainText -Force) -Description "Usuario con permisos de lectura"
}

# Crear recurso compartido
New-SmbShare -Name $recursoCompartido -Path $rutaCarpeta -FullAccess $usuarioMiguel -ReadAccess $usuarioSara
Grant-SmbShareAccess -Name $recursoCompartido -AccountName $usuarioMiguel -AccessRight Full
Grant-SmbShareAccess -Name $recursoCompartido -AccountName $usuarioSara -AccessRight Read

Write-Host "Usuarios y recurso compartido creados correctamente." -ForegroundColor Green
