function Test-passwd{
    param(
        [string]$pass
    )

    $longi = $pass.Length
    $max =  "[A-Z]"
    $min =  "[a-z]"
    $num =  "[0-9]"
    $carac =  "[^a-zA-Z0-9]"
 
    if($longi -lt 8){
        Write-Host "Minimo 8 caracteres"
        return $false
    }

    if( $pass -notmatch $max ){
        Write-Host "Minimo un caracter en mayuscula"
        return $false
    }

    if( $pass -notmatch $min ){
        Write-Host "Minimo un caracter en minuscula"
        return $false
    }

    if( $pass -notmatch $num ){
        Write-Host "Minimo un numero"
        return $false
    }

    if( $pass -notmatch $carac ){
        Write-Host "Minimo un caracter especial"
        return $false
    }

    return $true

}


$nombre = Read-Host "Dime el nombre del usuario"
$pass = Read-Host "dime la contraseña"

Write-Host $pass

if (Test-passwd  $pass){
        New-LocalUser -Name $nombre -Password (ConvertTo-SecureString -AsPlainText $pass -Force)
        Add-LocalGroupMember -Group "Usuarios" -Member $nombre
        Write-Host "Usuario creado"
        Read-Host
}else{
    Write-Host "La contraseña no es segura"
}
#Test-passwd $pass