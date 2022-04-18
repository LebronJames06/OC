<#

.SYNOPSIS
A simple program that will help you about DNS.

.DESCRIPTION
It has function on how to resolve the DNS, resolve DNS Property, Get-Host Address and Get-Host Address Property.
.NOTES
In putting a property it is the same in the command of the powershell.
if it has A B C D E property and you want to query A and E.
and the program ask you to put it type : A, E

.LINK


#>
function resolve_dns(){
$dns = Read-Host -Prompt "Enter a DNS/Website"
Resolve-DnsName -Name $dns
}
function resolve_dns_property(){
$property = Read-Host -Prompt "Enter a property you want to show (Name, Type, TTL, Section, IPAddress)"
$dns = Read-Host -Prompt "Enter a DNS/Website"
Resolve-DnsName -Name $dns | Select-Object -Property $property
}
function gethost_addresses(){
$dns = Read-Host -Prompt "Enter a DNS/Website"
[system.net.dns]::gethostaddresses($dns)
}
function gethost_addresses_property(){
$dns = Read-Host -Prompt "Enter a DNS/Website"
$property = Read-Host -Prompt "Enter a property you want to show (Address, AddressFamily, ScopeId, IsIPv6Multicast, IsIPv6LinkLocal, IsIPv6SiteLocal, IsIPv6Teredo, IsIPv4MappedToIPv6, IPAddressToString)"
[system.net.dns]::gethostaddresses($dns) | Select-Object -Property $property
}


Write-Host "1-Resolve a DNS"
Write-Host "2-Resolve a DNS with Filters"
Write-Host "3-Ret Host Address"
Write-Host "4-Ret Host Address with Filters"


$item_number = Read-Host -Prompt "Enter the number to run a command"

switch ($item_number) {
1 {resolve_dns}
2 {resolve_dns_property}
3 {gethost_addresses}
4 {gethost_addresses_property}
}