<#

.SYNOPSIS
A Simple program that will show your files on your FTP Server.

.DESCRIPTION
This one is very helpful if you want to check a file on your FTP Server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/

.LINK


#>
function get_UDP_port(){
Get-NetUDPEndpoint
}

function get_port_connection(){
$port = Read-Host -Prompt "port number "	
$c = Get-NetUDPEndpoint
Foreach ($i in $c)
{
if ($i.LocalPort -eq $port)
{
$i
}
}
}


function get_process_used_port(){
$localport = Read-Host -Prompt "port number: "
$c = Get-NetUDPEndpoint |Select-Object -Property LocalPort, @{name='ProcessID';expression={(Get-Process -Id $_.OwningProcess). ID}}, @{name='ProcessName';expression={(Get-Process -Id $_.OwningProcess). Path}}
Foreach ($i in $c)
{
if ($i.LocalPort -eq $localport)
{
$i
}
}
}

Write-Host "1-Get UDP ports"
Write-Host "2-Get UPD specific ports"
Write-Host "3-Get processes that uses the port"


$item_number = Read-Host -Prompt "Enter the number to run a command"

switch ($item_number) {
1 {get_UDP_port}
2 {get_port_connection}
3 {get_process_used_port}
}