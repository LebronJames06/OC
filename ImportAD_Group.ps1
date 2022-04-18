<#

.SYNOPSIS
A Simple program that will show your files on your FTP Server.

.DESCRIPTION
This one is very helpful if you want to check a file on your FTP Server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/

.LINK


#>
$path = Read-Host -Prompt "Enter full path of the CSV file:"	
$csv = Import-csv -Path $path
$name=$item.GroupName

Foreach ($item in $csv)
{

    try
{ 
      
    New-ADGroup -Name $item.GroupName -GroupCategory $item.GroupCategory -groupScope $item.groupScope -Path $item.OU
    Write-Host -ForeGroundColor Green "Group $($item.GroupName) created!"

}

catch
{

Write-Host "Group already exists $name"

}

}	