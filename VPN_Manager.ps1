<#

.SYNOPSIS
A Simple program that will show your files on your FTP Server.

.DESCRIPTION
This one is very helpful if you want to check a file on your FTP Server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/

.LINK


#>
function vpn_connect_no(){
$vpn_name = Read-Host -Prompt "Type your VPM name: "	
$server_address  = Read-Host -Prompt "Type your VPN server address: "	

Add-VpnConnection -Name $vpn_name -ServerAddress $server_address
}

function vpn_connect_pap(){
$vpn_name = Read-Host -Prompt "Type your VPM name: "	
$server_address  = Read-Host -Prompt "Type your VPN server address: "	
$tunnel_type = Read-Host -Prompt "Type your tunnel type: "		
$authentication = Read-Host -Prompt "Type atuhentication method: "
Add-VpnConnection -Name $vpn_name -ServerAddress $server_address -TunnelType $tunnel_type -EncryptionLevel "Optional" -AuthenticationMethod $authentication
}

function vpn_connect_shared(){
$vpn_name = Read-Host -Prompt "Type your VPM name: "	
$server_address  = Read-Host -Prompt "Type your VPN server address: "		
$key = Read-Host -Prompt "Type your shared key: "
$authentication = Read-Host -Prompt "Type atuhentication method: "
Add-VpnConnection -Name $vpn_name -ServerAddress $server_address -TunnelType L2TP -L2tpPsk $key -AuthenticationMethod $authentication -Force
}

function vpn_connect_show(){
Get-Vpnconnection
}

function vpn_connect(){
$vpn_name = Read-Host -Prompt "Type your VPM name: "	
rasdial $vpn_name
}

function vpn_remove(){
$vpn_name = Read-Host -Prompt "Type your VPM name: "	
Remove-VpnConnection -Name $vpn_name
}

Write-Host "1-Create a VPN Connection"
Write-Host "2-Create a VPN Connection with Encrption"
Write-Host "3-Create a VPN Connection with Key"
Write-Host "4-Show all VPN Connection"
Write-Host "5-Connect to a VPN"
Write-Host "6-Disconnect to a VPN"

$item_number = Read-Host -Prompt "Enter the number to run a command"

switch ($item_number) {
1 {vpn_connect_no}
2 {vpn_connect_pap}
3 {vpn_connect_shared}
4 {vpn_connect_show}
5 {vpn_connect}
6 {vpn_remove}
}