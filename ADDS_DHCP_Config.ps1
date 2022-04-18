<#

.SYNOPSIS
A Simple program that will show your files on your FTP Server.

.DESCRIPTION
This one is very helpful if you want to check a file on your FTP Server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/

.LINK


#>
function computer_name(){
$name = Read-Host -Prompt "Type your computer name: "	
Rename-Computer -NewName $name -Restart 
}
function ADDS(){
Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools
}
function DHCP(){
Install-WindowsFeature DHCP -IncludeManagementTools
}
function add_forest(){
$vpn_name = Read-Host -Prompt "Type your VPM name: "	
Install-ADDSForest -DomainName $vpn_name -InstallDNS 
}
function add_domain(){
$netbios = Read-Host -Prompt "Type your NETBIOS: "	
Add-Computer $netbios
}

Write-Host "1-Change Computer name"
Write-Host "2-Install AD DS"
Write-Host "3-install DHCP"
Write-Host "4-Add Server to a Forest"
Write-Host "5-Add Server to a Domain"

$item_number = Read-Host -Prompt "Enter the number to run a command"

switch ($item_number) {
1 {computer_name}
2 {ADDS}
3 {DHCP}
4 {add_forest}
5 {add_domain}
}