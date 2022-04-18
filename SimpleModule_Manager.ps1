<#

.SYNOPSIS
A Simple program that will show your files on your FTP Server.

.DESCRIPTION
This one is very helpful if you want to check a file on your FTP Server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/

.LINK


#>
function list_available_module(){
Get-Module -Listavailable
}

function install_module(){
$name = Read-Host -Prompt "Type module name here: "
Install-Module -Name $name
}

function list_installed_module(){
Get-InstalledModule
}

Write-Host "1-List avaible module ready to installed"
Write-Host "2-List of installed module"
Write-Host "3-Install a module"


$item_number = Read-Host -Prompt "Enter the number to run a command"

switch ($item_number) {
1 {list_available_module}
2 {list_installed_module}
3 {install_module}
}