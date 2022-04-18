<#

.SYNOPSIS
A Simple program that will show owners of the files of the folder.

.DESCRIPTION
It will help you check if the user owned the file.

.NOTES
It will ask you for the full path of the folder.

.LINK


#>
$path = Read-Host -Prompt "Enter full path of the folder"
$folder=Get-ChildItem -Path $path -Recurse
ForEach ($file in $folder) {
Get-Acl -Path $file.FullName | Select -Property @{name='File';expression={$file.FullName}}, Owner
}