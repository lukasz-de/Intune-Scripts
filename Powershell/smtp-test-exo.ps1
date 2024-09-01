# Send Test Mail with Powershell
# https://github.com/lukasz-de
# Lukasz Hauptman | lukasz.de | 2024
Send-MailMessage -From 'sender@yourdomain.com' -To 'recipient@yourdomain.com' -Subject "SMTP Client - $(Get-Date -Format g)" -Body "Test Microsoft 365 SMTP-Relais" -SmtpServer smtp.office365.com -Credential $cred -UseSsl -Port 587