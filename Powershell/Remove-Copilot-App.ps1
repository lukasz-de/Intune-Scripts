
# Remove Copilot from Windows 10/11
# https://github.com/lukasz-de
# Lukasz Hauptman | lukasz.de | 2025


$LogFilePath = "C:\#temp\AppRemovalLog.txt"
if (!(Test-Path -Path $LogFilePath)) {
    New-Item -Path $LogFilePath -ItemType File -Force | Out-Null
}
Function Write-Log {
    param (
        [string]$Message,
        [string]$Type = "INFO"
    )
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $LogEntry = "$Timestamp [$Type] $Message"
    Write-Output $LogEntry | Out-File -FilePath $LogFilePath -Append
}

# Define the list of apps to remove
$AppsToRemove = @(
    "Microsoft.Copilot",# Copilot
)

# Remove apps for current user and provisioned apps for all users
Function Remove-App {
    param (
        [string]$AppName
    )

    Write-Log "Attempting to remove app: $AppName"

    Try {
        # Entfernen der App
        Get-AppxPackage -Name $AppName -AllUsers | Remove-AppxPackage -AllUsers -ErrorAction Stop
        Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -like "*$AppName*" } | Remove-AppxProvisionedPackage -Online -ErrorAction Stop

        Write-Log "Successfully removed $AppName" "SUCCESS"
    } Catch {
        $ErrorMessage = $_.Exception.Message
        Write-Log "Failed to remove $AppName ":" $ErrorMessage" " ERROR"
    }
}

# Iterate through the list of apps and remove them
foreach ($App in $AppsToRemove) {
    Remove-App -AppName $App
}

Write-Log "App removal script completed."