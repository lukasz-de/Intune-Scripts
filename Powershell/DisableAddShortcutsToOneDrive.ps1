# Disable Add Shortcuts To OneDrive in Teams and SharePoint Online
# https://github.com/lukasz-de
# Lukasz Hauptman | lukasz.de | 2024

Connect-SPOService -Url https://<tenant>-admin.sharepoint.com

Set-SPOTenant -DisableAddShortcutsToOneDrive $True
