<#

.SYNOPSIS
A Simple program that will show your files on your FTP Server.

.DESCRIPTION
This one is very helpful if you want to check a file on your FTP Server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/

.LINK


#>

$a=(Get-aduser -filter * -properties *).Name
foreach($b in $a){
$c=(Get-aduser -identity $b -properties *).Whencreated
$d=((Get-aduser -identity $b -properties *).memberof|Get-Adgroup).Name -join ','

write-host "$b | $c | $d "

}