<#
.SYNOPSIS
A simple program that allows you to install, start, stop and get a info a VM!
.DESCRIPTION
This program will help you to manage your VM using hyperV, in installing a VM make sure that the drive you are using has a space of 20GB and free ram space of 4GB.
.Read-Host Enter the drive you want to use:
Drive name where you want to install you created VM example C: or D:
.Read-Host Enter the name of your VM:
Desired name of your VM.
.Read-Host Complete Path of ISO:
Complete path of the ISO file that you want to use to install the OS.
.Read-Host Enter the number to run a command:
Enter a number of the function you want to run.
.EXAMPLE
./simpleVM_Manager.ps1
Enter the number to run a command: 1 
Enter the drive you want to use: C:
Enter the name of your VM: Test
Complete Path of ISO: C:/ISO/Windows_10.iso

Enter the number to run a command: 2 
Enter the name of your VM: Test
#>

function Install_VM(){

$drive = Read-Host -Prompt "Enter the drive you want to use"	
$random = random
$name = Read-Host -Prompt "Enter the name of your VM"
$path_ISO = Read-Host -Prompt "Complete Path of ISO"

New-VM -Name $name -MemoryStartupBytes 4GB -Path $drive\$random.local
New-VHD -Path $drive\$random.local.vhdx -SizeBytes 20GB -Dynamic
Add-VMHardDiskDrive -VMName $name -Path $drive\$random.local.vhdx
Set-VMDvdDrive -VMName $name -ControllerNumber 1 -Path $path_ISO
Set-VMMemory -VMName $name -DynamicMemoryEnabled $true -StartupBytes 4GB -MinimumByte 512MB
}

function start_VM(){
$name = Read-Host -Prompt "Enter the name of your VM"	
Start-VM -Name $name
}

function info_VM(){
$name = Read-Host -Prompt "Enter the name of your VM"	
Get-VM $name
}

function stop_VM(){
$name = Read-Host -Prompt "Enter the name of your VM"	
Stop-VM $name
}

Write-Host "1-Create a VM"
Write-Host "2-Start a VM"
Write-Host "3-Get VM Information"
Write-Host "4-Stop a VM"


$item_number = Read-Host -Prompt "Enter the number to run a command"

switch ($item_number){
1 {Install_VM}
2 {start_VM}
3 {info_VM}
4 {stop_VM}
}