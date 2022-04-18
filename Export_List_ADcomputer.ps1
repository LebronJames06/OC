<#

.SYNOPSIS
A Simple program that will show your files on your FTP Server.

.DESCRIPTION
This one is very helpful if you want to check a file on your FTP Server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/

.LINK


#>
$path = Read-Host -Prompt "Enter full path and file name of the CSV:"	
get-adcomputer -properties* -filter * | export-csv $path