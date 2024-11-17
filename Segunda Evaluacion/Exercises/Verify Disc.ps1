# Verificar si la unidad ya está montada
if (-not (Get-PSDrive -Name "W" -ErrorAction SilentlyContinue)) {
    # Montar el recurso compartido como unidad W:
    New-PSDrive -Name "W" -PSProvider FileSystem -Root "\\localhost\APUNTES" -Persist
    Write-Host "Recurso compartido montado como unidad $letraUnidad." -ForegroundColor Green
} else {
    Write-Host "La unidad W ya está montada." -ForegroundColor Yellow
}