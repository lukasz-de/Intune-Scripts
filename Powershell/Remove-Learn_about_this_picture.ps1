# Remove Learn about this picture
# https://github.com/lukasz-de
# Lukasz Hauptman | lukasz.de | 2024

# Skript zum Setzen eines Registry-Wertes
# Funktioniert mit Intune und setzt den Wert auf 1

# Variablen für den Registry-Pfad und den Wert
$RegistryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel"
$ValueName = "{2cc5ca98-6485-489a-920e-b3e88a6ccce3}"
$ValueData = 1
$ValueType = "DWORD"  # Der Typ des Wertes (DWORD in diesem Fall)

# Prüfen, ob der Registry-Pfad existiert; falls nicht, wird er erstellt
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Den gewünschten Wert setzen
Set-ItemProperty -Path $RegistryPath -Name $ValueName -Value $ValueData -Type $ValueType

# Rückmeldung über den Erfolg
Write-Host "Registry-Wert erfolgreich gesetzt: $RegistryPath\$ValueName = $ValueData"