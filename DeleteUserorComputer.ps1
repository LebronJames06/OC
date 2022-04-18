<#

.SYNOPSIS
A Simple program that will show your files on your FTP Server.

.DESCRIPTION
This one is very helpful if you want to check a file on your FTP Server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/

.LINK


#>
#Provide the input to choose to delete either User and Computer

$input = read-host "Enter your choice"
Switch($input)
{
0 { $result = 'User Deletion'}
1 { $result = 'Computer Deletion'}

}

#If input is greater than 1 it will throw error.

if ($input -gt 1)

{
Write-host "$input is not mentioned in the provided choices"  -ForegroundColor Cyan

}

#If 0 is selected then provide the user name that needs to deleted.

if($input -eq 0)
{
$user = Read-host "Provide user Name" 
Try{
Remove-aduser $user -confirm:$false 

Write-host "User $user is deleted" -foregroundcolor DarkGreen}

Catch{

Write-host "$user is not present in AD or the Username is incorrect" -Foregroundcolor DarkRed 
}
}
#If 1 is selected then provide the computer name that needs to deleted.

if ($input -eq 1)

{

$computer = Read-host "Provide Computer Name"

Try{
Remove-ADComputer $computer -confirm:$false 


Write-host "User $computer is deleted" -BackgroundColor DarkGreen}

Catch{

Write-host "$Computer is not present in AD or the Computer name is incorrect" -BackgroundColor DarkRed 
}

}
