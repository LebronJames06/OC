<#

.SYNOPSIS
A Simple program that will show your files on your FTP Server.

.DESCRIPTION
This one is very helpful if you want to check a file on your FTP Server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/

.LINK


#>
#Takes input from users.csv file into this script

Import-Csv ".\user\Users.csv" | ForEach-Object {

#assign input value to variable-samAccountName 

$samAccountName = $_."samAccountName"

#get-aduser will retrieve samAccountName from domain users. if we found it will disable else it will go to catch

try { Get-ADUser -Identity $samAccountName |
Disable-ADAccount  
}

#It will run when we can't find user

catch {

#it will display the message

  Write-Host "user:"$samAccountname "is not present in AD"
}
}