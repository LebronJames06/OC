<#

.SYNOPSIS
A Simple program that will show your files on your FTP Server.

.DESCRIPTION
This one is very helpful if you want to check a file on your FTP Server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/

.LINK


#>
function get_ADuser(){
Get-aduser -properties * -filter *
}

function import_module(){
Import-module activedirectory
}

function get_computer(){
Get-adcomputer -properties * -filter *
}

function disable_account(){
$name = Read-Host -Prompt "Enter identity name"	
Disable-ADaccount -identity $name
}

function ADgroup(){
$name = Read-Host -Prompt "Enter group name"	
Get-ADgroup -identity $name
{

function domain_info(){
Get-ADdomain
}

function domain_controller(){
Get-ADDomainController
}

Write-Host "1-Get all ADuser"
Write-Host "2-Import module activedirectory"
Write-Host "3-Get all ADcomputers"
Write-Host "4-Disable user account using identity"
Write-Host "5-Search ADgroup"
Write-Host "6-Get domain information"
Write-Host "7-Get AD domain controller"



$item_number = Read-Host -Prompt "Enter the number to run a command"

switch ($item_number) {
1 {get_ADuser}
2 {import_module}
3 {get_computer}
4 {disable_account}
5 {ADgroup}
6 {domain_info}
7 {domain_controller}
}