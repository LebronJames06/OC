<#

.SYNOPSIS
A Simple program that will show your files on your FTP Server.

.DESCRIPTION
This one is very helpful if you want to check a file on your FTP Server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/

.LINK


#>
Get-NetAdapter -Name * | Out-Host
$index = Read-Host -Prompt "Enter Adpater Index"	
$DNS = Read-Host -Prompt "Enter your DNS IP Address"
$DomainNmae = Read-Host -Prompt "Enter your dDomain Name"
set-DnsClientServerAddress -InterfaceIndex $index -ServerAddresses ($DNS)
set-DnsClientServerAddress -InterfaceAlias Ethernet -AddressFamily IPv4 |Select-Object ServerAddresses 

Add-Computer -ComputerName $computers -Domain $DomainNmae -Restart