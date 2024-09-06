# Lukasz Hauptman lukasz.de | 2024
# Manually register devices with Windows Autopilot

md c:\#BT-DEV-HASH
Set-Location c:\#BT-DEV-HASH
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted
Install-Script -Name Get-WindowsAutoPilotInfo
Get-WindowsAutoPilotInfo.ps1 -OutputFile c:\#BT-DEV-HASH\Devicehash.csv