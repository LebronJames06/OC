<#

.SYNOPSIS
A Simple program that will show your files on your FTP Server.

.DESCRIPTION
This one is very helpful if you want to check a file on your FTP Server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/

.LINK


#>
function disk_space(){
Get-WmiObject -Class win32_logicaldisk | Select DeviceId, MediaType, @{n="Size";e={[math]::Round($_.Size/1GB,2)}},@{n="FreeSpace";e={[math]::Round($_.FreeSpace/1GB,2)}} | Out-Host 
}

function get_path_info(){
$path = Read-Host -Prompt "Type full Drive path or folder path: "	
Get-ChildItem -Path $path 
}

function get_all_path_files(){
$path = Read-Host -Prompt "Type full Drive path or folder path: "	
Get-ChildItem -Path $path -Recurse	
}

Write-Host "1-Get Gard  Drive Information"
Write-Host "2-Get Path Folder and File list"
Write-Host "3-Get Path all Folder and File list"


$item_number = Read-Host -Prompt "Enter the number to run a command"

switch ($item_number) {
1 {disk_space}
2 {get_path_info}
3 {get_all_path_files}
}