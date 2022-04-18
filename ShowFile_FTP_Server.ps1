<#

.SYNOPSIS
A Simple program that will show your files on your FTP Server.

.DESCRIPTION
This one is very helpful if you want to check a file on your FTP Server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/

.LINK


#>

$username = Read-Host -Prompt "Type your FTP user name: "	
$password  = Read-Host -Prompt "Type your FTP password: "	
$ftpuri = Read-Host -Prompt "Type your FTP Host: "	


$uri=[system.URI] $ftpuri
$ftprequest=[system.net.ftpwebrequest]::Create($uri)
$ftprequest.Credentials=New-Object System.Net.NetworkCredential($username,$password)
$ftprequest.Method=[system.net.WebRequestMethods+ftp]::ListDirectory
$response=$ftprequest.GetResponse()
$strm=$response.GetResponseStream()
$reader=New-Object System.IO.StreamReader($strm,'UTF-8')
$list=$reader.ReadToEnd()
$lines=$list.Split("`n")
return $lines