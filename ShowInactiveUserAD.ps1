<#

.SYNOPSIS
A Simple program that will show your files on your FTP Server.

.DESCRIPTION
This one is very helpful if you want to check a file on your FTP Server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/

.LINK


#>

#Get-Date gives the present date in the server and is assigned to the variable presentdate
$presentdate= Get-Date

#User names whose lastlogondate is less than the presentdate-90days and those usernames are given to the variable output 
$output=Get-ADUser -Filter * -Properties lastlogondate | Where-Object {$_.lastlogondate -lt $presentdate.adddays(-90)} | select name

#This output is exported to a .csv file 
$output | Export-Csv .\inactiveusers.csv -NoTypeInformation

#This prints the users who are inactive by taking from the output
Write-Host "The following users are inactive : " -ForegroundColor DarkYellow
$output