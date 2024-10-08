#!/bin/zsh
# Lukasz Hauptman lukasz.de | 2024
# Username and Password to create
username=Administrator
password="MyPassword"
# Create User and add to admins
dscl . -create /Users/$username
dscl . -create /Users/$username UserShell /bin/bash
dscl . -create /Users/$username RealName $username
dscl . -create /Users/$username UniqueID "510"
dscl . -create /Users/$username PrimaryGroupID 20
dscl . -create /Users/$username NFSHomeDirectory /Users/$username
dscl . -passwd /Users/$username $password
dscl . -append /Groups/admin GroupMembership $username
done