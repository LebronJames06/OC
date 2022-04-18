<#

.SYNOPSIS
A simple program that will export AS user information and show AD user creation date.

.DESCRIPTION
This program will help you about manager ADuser of the ADDC.

.NOTES
Make sure that you have folder name user on the root where this file is located.
It will be save there the exported file with random number filename on it.

.LINK


#>
function ad_user_export(){
$Days = Read-Host -Prompt "Type your number of days query:"
$random = random
$Time = (Get-Date).Adddays(-($Days))
Get-ADUser -Filter * -Property whenCreated | Where {$_.whenCreated -gt $Time} | Select DistinguishedName, Enabled, GivenName, Name, ObjectClass, ObjectGUID, SamAccountName, SID, Surname, UserPrincipalName, whenCreated | export-csv .\user\$random.csv
}

function ad_user_created(){
$Days = Read-Host -Prompt "Type your number of days query:"
$Time = (Get-Date).Adddays(-($Days))
Get-ADUser -Filter * -Property whenCreated | Where {$_.whenCreated -gt $Time} | ft Name, WhenCreated
}

function ad_user_info(){
$user = Read-Host -Prompt "Type the username of the ADuser:"
Get-ADUser -Identity $user -Properties *
}

Write-Host "1-Export CSV file ADuser Information"
Write-Host "2-Show ADuser's creation date"
Write-Host "3-Show ADuser Information"


$item_number = Read-Host -Prompt "Enter the number to run a command"

switch ($item_number) {
1 {ad_user_export}
2 {ad_user_created}
3 {ad_user_info}
}