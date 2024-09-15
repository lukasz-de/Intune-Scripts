# Lukasz Hauptman lukasz.de | 2024
# Create local administrator account

# Setzt den Benutzernamen und das Passwort für den neuen Administrator
$Username = "LAPSAdmin"  # Ändere diesen Namen auf den gewünschten Administrator-Benutzernamen
$SecurePassword = ConvertTo-SecureString -String (-join ((33..126) | Get-Random -Count 32 | % {[char]$_})) -AsPlainText -Force

# Prüft, ob der Benutzer bereits existiert
$User = Get-LocalUser -Name $Username -ErrorAction SilentlyContinue

if ($User -eq $null) {
    # Erstellt den neuen lokalen Benutzer
    New-LocalUser -Name $Username -Password $SecurePassword -FullName $Username -Description "Entra ID LAPS Administrator" -PasswordNeverExpires

    # Fügt den neuen Benutzer der lokalen Administratorengruppe hinzu
    Add-LocalGroupMember -SID S-1-5-32-544 -Member $Username

    Write-Host "User $Username has been successfully created and added to the administrators group."
} else {
    Write-Host "User $Username already exists."
}
