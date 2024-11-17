$usuarios = @("Jaime", "Belén", "Marta", "Luis", "Carlos", "Juan")
New-LocalGroup -Name DAW
New-LocalGroup -Name DAM
New-LocalGroup -Name IES

foreach($usuario in $usuarios) {
    New-LocalUser -Name $usuario -NoPassword
    Add-LocalGroupMember -Group "usuarios" -Member $usuario    
    Add-LocalGroupMember -Group "IES" -Member $usuario    
}

Add-LocalGroupMember -Group "DAW" -Member "Luis" , "Carlos"
Add-LocalGroupMember -Group "DAM" -Member "Belén" , "Marta"    

if (Test-Path C:\SENIA -PathType Container) {
} else {
    New-Item -Path C:\SENIA -ItemType Directory
    New-Item -Path C:\SENIA\APUNTES -ItemType Directory
    New-Item -Path C:\SENIA\APUNTES\DAW -ItemType Directory
    New-Item -Path C:\SENIA\APUNTES\DAM -ItemType Directory
}

# DESHABILITAR LA HERENCIA DE DAW Y DE DAM
$acl = Get-Acl -Path C:\SENIA\APUNTES\DAW
$acl.SetAccessRuleProtection($true, $false)
Set-Acl -Path C:\SENIA\APUNTES\DAW -AclObject $acl

$acl = Get-Acl -Path C:\SENIA\APUNTES\DAM
$acl.SetAccessRuleProtection($true, $false)
Set-Acl -Path C:\SENIA\APUNTES\DAM -AclObject $acl
# Solo lectura de IES en SENIA
$acl = Get-Acl C:\SENIA
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("IZAN\IES","Read", "Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl C:\SENIA

# Control total de Juan en APUNTES
$acl = Get-Acl C:\SENIA\APUNTES
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("IZAN\Juan", "FullControl", "Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl C:\SENIA\APUNTES

# Lectura a DAW y DAM en APUNTES
$acl = Get-Acl C:\SENIA\APUNTES
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("IZAN\DAW", "Read", "Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl C:\SENIA\APUNTES

$acl = Get-Acl C:\SENIA\APUNTES
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("IZAN\DAM", "Read", "Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl C:\SENIA\APUNTES

# Lectura, escritura y ejecución a DAW EN DAW
$acl = Get-Acl C:\SENIA\APUNTES\DAW
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("IZAN\DAW", "Read", "Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl C:\SENIA\APUNTES\DAW

$acl = Get-Acl C:\SENIA\APUNTES\DAW
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("IZAN\DAW", "Write", "Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl C:\SENIA\APUNTES\DAW

$acl = Get-Acl C:\SENIA\APUNTES\DAW
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("IZAN\DAW", "Execute", "Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl C:\SENIA\APUNTES\DAW

# SIN ACCESO DAM EN DAW
$acl = Get-Acl C:\SENIA\APUNTES\DAW
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("IZAN\DAM", "FullControl", "ContainerInherit, ObjectInherit", "None", "Deny")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl C:\SENIA\APUNTES\DAW

# Lectura, escritura y ejecución a DAM EN DAM
$acl = Get-Acl C:\SENIA\APUNTES\DAM
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("IZAN\DAM", "Read", "Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl C:\SENIA\APUNTES\DAM

$acl = Get-Acl C:\SENIA\APUNTES\DAM
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("IZAN\DAM", "Write", "Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl C:\SENIA\APUNTES\DAM

$acl = Get-Acl C:\SENIA\APUNTES\DAM
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("IZAN\DAM", "Execute", "Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl C:\SENIA\APUNTES\DAM

# SIN ACCESO DAW EN DAM
$acl = Get-Acl C:\SENIA\APUNTES\DAM
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("IZAN\DAW", "FullControl", "ContainerInherit, ObjectInherit", "None", "Deny")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl C:\SENIA\APUNTES\DAM