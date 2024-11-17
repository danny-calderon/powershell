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
$password = Read-Host "Ingrese la contraseña"
Test-Passwd -password $password
