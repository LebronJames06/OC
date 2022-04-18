<#

.SYNOPSIS
A Simple program that will show your files on your FTP Server.

.DESCRIPTION
This one is very helpful if you want to check a file on your FTP Server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/

.LINK


#>
$user = Read-Host -Prompt "Enter Proxy Username: "	
$password = Read-Host -Prompt "Enter Proxy Password: "	
$proxy = Read-Host -Prompt "Enter proxy provider / server: "	
$URL = Read-Host -Prompt "URL you want to visit: "	


[SecureString]$SecurePassword = $password | ConvertTo-SecureString -AsPlainText -Force 
$MyCredential = New-Object System.Management.Automation.PSCredential -ArgumentList $user, $SecurePassword


$MyAccess = Invoke-WebRequest -Uri $URL -UseBasicParsing -Proxy $proxy -ProxyCredential $MyCredential
$MyAccess.RawContent