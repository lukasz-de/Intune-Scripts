# Lukasz Hauptman lukasz.de | 2024
# Manually register devices with Windows Autopilot

md c:\#Devicehash
Set-Location c:\#Devicehash
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted
Install-Script -Name Get-WindowsAutoPilotInfo
Get-WindowsAutoPilotInfo.ps1 -OutputFile c:\#Devicehash\_Devicehash.csv