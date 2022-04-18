<#

.SYNOPSIS
A Simple program that will show your files on your FTP Server.

.DESCRIPTION
This one is very helpful if you want to check a file on your FTP Server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/

.LINK


#>
function install_module(){
Install-Module AzureAD
}
function connect_azure(){
Connect-AzureAD
}
function get_azure_ADUser(){
Connect-AzureAD	
Get-AzADUser
}
function invoke_azure_command(){
$name = Read-Host -Prompt "Type AD name here: "
$script = Read-Host -Prompt "Type script block here: "
Invoke-AzVMCommand -Name $name -ResourceGroupName 'azure-cloudshell-demo' -ScriptBlock {$script} -Credential (get-credential)
}

function  get_azure_resource(){
$name = Read-Host -Prompt "Type AD name here: "
$resource = Read-Host -Prompt "Type resource group name: "
Enter-AzVM -name $name -ResourceGroupName $resource -Credential (get-credential)
}

Write-Host "1-Install AzureAD Module"
Write-Host "2-Connect to AzureAD"
Write-Host "3-Get Azure ADuser"
Write-Host "4-Connect to AzureAD at run s scriptblock"
Write-Host "5-Connect to AzureAD and get resource information"

$item_number = Read-Host -Prompt "Enter the number to run a command"

switch ($item_number) {
1 {install_module}
2 {connect_azure}
3 {get_azure_ADUser}
4 {invoke_azure_command}
5 {get_azure_resource}
}