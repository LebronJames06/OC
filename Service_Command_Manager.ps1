<#

.SYNOPSIS
A Simple program that will show your files on your FTP Server.

.DESCRIPTION
This one is very helpful if you want to check a file on your FTP Server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/

.LINK


#>
function get_all_service(){
Get-Service
}

function select_a_service(){
$name = Read-Host -Prompt "Type your query here: "		
Get-Service -Name $name
}

function stop_service(){
$name = Read-Host -Prompt "Type your query here: "	
Stop-Service -name $name -Force -Confirm
}

function start_service(){
$name = Read-Host -Prompt "Type your query here: "	
Start-Service -name $name
}

function disable_service(){
$name = Read-Host -Prompt "Type your query here: "	
Set-Service -name $name -startupType disabled
}

function manual_service(){
$name = Read-Host -Prompt "Type your query here: "	
Set-Service $name -StartupType manual
}


Write-Host "1-Get a list of services"
Write-Host "2-Select a list of services"
Write-Host "3-Stop a service"
Write-Host "4-Start a service"
Write-Host "5-Disable a service"
Write-Host "6-Set status to manual a service"

$item_number = Read-Host -Prompt "Enter the number to run a command"

switch ($item_number) {
1 {get_all_service}
2 {select_a_service}
3 {stop_service}
4 {start_service}
5 {disable_service}
6 {manual_service}
}