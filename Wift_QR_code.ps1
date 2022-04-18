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
Install-Module -Name QRCodeGenerator
}

function generate(){
$wifi_name = Read-Host -Prompt "Enter Wifi Name: "	
$wifi_password = Read-Host -Prompt "Enter Wifi Password: "	
$path = Read-Host -Prompt "full path file name of you QR code: "	
New-QRCodeWifiAccess -SSID $wifi_name -Password $wifi_password -Width 15 -OutPath $path
}

Write-Host "1-Install module for QR generation"
Write-Host "2-Generate QR code"




$item_number = Read-Host -Prompt "Enter the number to run a command"

switch ($item_number) {
1 {install_module}
2 {generate}

}