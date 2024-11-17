# Creación de usuarios de forma masiva

$usuarios = Import-Csv -Path "C:\usuarios.csv"

foreach ($i in $usuarios) {
    $clave = ConvertTo-SecureString $i.contra -AsPlainText -Force
    New-LocalUser -Name $i.nombre -Password $clave -AccountNeverExpires
    Add-LocalGroupMember -Group "usuarios" -Member $i.nombre
}
