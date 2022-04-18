<#

.SYNOPSIS
A Simple program that will show your files on your FTP Server.

.DESCRIPTION
This one is very helpful if you want to check a file on your FTP Server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/

.LINK


#>
function set_ipv4(){
$set_index = Read-Host -Prompt "Number of index of the the interface: "
$IPv4 = Read-Host -Prompt "IPV6 IP address: "
$prefix = Read-Host -Prompt "Prefix (default is 64): "
$default_gateway = Read-Host -Prompt "Type default gateway: "

$DNS_one = Read-Host -Prompt "Type DNS: "
$DNS_two = Read-Host -Prompt "Type second DNS: "

New-NetIPAddress -InterfaceIndex $set_index -IPAddress $IPv4 -PrefixLength $prefix -DefaultGateway $default_gateway		
Set-DnsClientServerAddress -InterfaceIndex $set_index -ServerAddresses ($DNS_one,$DNS_two)	
}

function set_ipv6(){
$set_index = Read-Host -Prompt "Number of index of the the interface: "
$IPv6 = Read-Host -Prompt "IPV6 IP address: "
$prefix = Read-Host -Prompt "Prefix (default is 24): "
$default_gateway = Read-Host -Prompt "Type default gateway: "

New-NetIPAddress -InterfaceIndex $set_index -AddressFamily IPv6 -IPAddress $IPv6 -PrefixLength $prefix -DefaultGateway $default_gateway	
}
function get_adapter(){
Get-NetAdapter -Name *
}
function remove_adapter(){ 
$set_index = Read-Host -Prompt "Number of index of the the interface: "
Remove-NetIPAddress -InterfaceIndex $set_index -Confirm:$false
Remove-NetRoute -InterfaceIndex $set_index -Confirm:$false
}

Write-Host "1-Show List of Adapter"
Write-Host "2-Remove current configuration of Adapter"
Write-Host "3-Set IPV4 address"
Write-Host "4-Set IPV6 address"


$item_number = Read-Host -Prompt "Enter the number to run a command"

switch ($item_number) {
1 {get_adapter}
2 {remove_adapter}
3 {set_ipv4}
4 {set_ipv6}
}