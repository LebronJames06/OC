<#

.SYNOPSIS
A Simple program that will show your files on your FTP Server.

.DESCRIPTION
This one is very helpful if you want to check a file on your FTP Server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/

.LINK


#>
function get_TCP(){ 
 Get-NetTCPConnection
}

function get_TCP_listen(){
 Get-NetTCPConnection -State Listen
}

function get_IP(){
$remoteIP = Read-Host -Prompt "remoteIP: "	
$c = Get-NetTCPConnection
	foreach ($i in $c)
	{
		if ($i.RemoteAddress -eq $remoteIP)
		{
		$i
		}
	}
}

function get_port(){
$remotePort = Read-Host -Prompt "remotePort: "		
$c = Get-NetTCPConnection
	foreach ($i in $c)
	{
		if ($i.RemotePort -eq $remotePort)
		{
		$i
		}
	}
}

function get_process(){
$localPort = Read-Host -Prompt "LocalPort: "
$c = Get-NetTCPConnection -State Listen |Select-Object -Property LocalPort, State, @{name='ProcessID';expression={(Get-Process -Id $_.OwningProcess). ID}}, @{name='ProcessName';expression={(Get-Process -Id $_.OwningProcess). Path}}
	foreach ($i in $c)
	{
		if ($i.LocalPort -eq $localPort)
		{
		$i
		}
	}
}

Write-Host "1-Get TCP Connections"
Write-Host "2-Get TCP Connections state is Listen"
Write-Host "3-List TCP connection on specific IP address"
Write-Host "4-List TCP connection on specific Port"
Write-Host "5-List Process that uses the specific Local Port"


$item_number = Read-Host -Prompt "Enter the number to run a command"

switch ($item_number) {
1 {get_TCP}
2 {get_TCP_listen}
3 {get_IP}
4 {get_port}
5 {get_process}
}