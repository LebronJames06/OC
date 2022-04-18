<#

.SYNOPSIS
A Simple program that will show your files on your FTP Server.

.DESCRIPTION
This one is very helpful if you want to check a file on your FTP Server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/

.LINK


#>
function eventlog_list(){
Get-EventLog -List
}

function evenlog_system(){
$name = Read-Host -Prompt "Enter LogName: "	
$result = Read-Host -Prompt "Enter number of query result: "	
Get-EventLog -LogName $name -Newest $result
}

function eventlog_error(){
$name = Read-Host -Prompt "Enter LogName: "	
Get-EventLog -LogName $name -EntryType Error
}

function eventlog_instance_source(){
$name = Read-Host -Prompt "Enter LogName: "	
$InstanceId = Read-Host -Prompt "Enter InstanceId: "	
$Source = Read-Host -Prompt "Enter Source: "	
Get-EventLog -LogName $name -InstanceId $InstanceId -Source $Source
}

function eventlog_message_search(){
$name = Read-Host -Prompt "Enter LogName: "	
$InstanceId = Read-Host -Prompt "Enter prahse you want to search: "	
Get-EventLog -LogName $name -Message $InstanceId
}

Write-Host "1-Get event logs on the local computer"
Write-Host "2-Get event logs using LogName"
Write-Host "3-Get event logs using LogName and Type Error"
Write-Host "4-Get event logs using Logname, InstanceID and Source"
Write-Host "5-Search event logs message"




$item_number = Read-Host -Prompt "Enter the number to run a command"

switch ($item_number) {
1 {eventlog_list}
2 {evenlog_system}
3 {eventlog_error}
4 {eventlog_instance_source}
5 {eventlog_message_search}
}