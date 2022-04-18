<#

.SYNOPSIS
A Simple program that will show your files on your FTP Server.

.DESCRIPTION
This one is very helpful if you want to check a file on your FTP Server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/

.LINK


#>
$group1 = read-host "Enter  group 1"
$group2 = read-host "Enter  group 2"

$a= get-adgroupmember -identity $group1 |select -expandproperty Name
$b= get-adgroupmember -identity $group2 |select -expandproperty Name

compare $b $a -includeequal