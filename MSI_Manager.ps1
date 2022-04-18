<#

.SYNOPSIS
A Simple program that will show your files on your FTP Server.

.DESCRIPTION
This one is very helpful if you want to check a file on your FTP Server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/

.LINK


#>
function install_using_MSI(){
 $path = Read-Host -Prompt "Location of MSI you want to install "	
 msiexec.exe /I $path /L*V ".\msi-install.log"
}

function fix_installation_MSI(){
 $path = Read-Host -Prompt "Location of MSI that you want fix "		
 msiexec.exe /fa $path
}

function remmove_installation_MSI(){
 $path = Read-Host -Prompt "Location of MSI that you want to remove "		
 msiexec.exe /x $path
}

function list_all(){
	$msi = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |  Select-Object DisplayName, UninstallString
	$msi += Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, UninstallString
	$msi | ?{ $_.DisplayName -ne $null -and $_.UninstallString -match 'msiexec' } | sort-object -Property DisplayName -Unique | Format-Table -AutoSize
}

Write-Host "1-Insall a program using MSI file"
Write-Host "2-Fix the program using MSI file"
Write-Host "3-Remove a Program using MSI file"
Write-Host "4-List all program that installed using MSI"



$item_number = Read-Host -Prompt "Enter the number to run a command"

switch ($item_number) {
1 {install_using_MSI}
2 {fix_installation_MSI}
3 {remmove_installation_MSI}
4 {list_all}
}