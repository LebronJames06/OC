<#

.SYNOPSIS
A simple program that will upload file on your FTP server.

.DESCRIPTION
This program is made to upload files on your FTP server.
It needs username, password and host of your FTP server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/.
Make sure that you have a folder named ftp on the root where this file is located.
In that folder you will put all the files that you want to upload in your FTP Server.

.LINK


#>
$username = Read-Host -Prompt "Type your FTP user name: "	
$password  = Read-Host -Prompt "Type your FTP password: "	
$remote_file = Read-Host -Prompt "Type your FTP Host: "	

$local_file = ".\ftp\"
$files = Get-ChildItem $local_file

foreach ($file in $files)
{
	$ftprequest = [System.Net.FtpWebRequest]::Create("$remote_file\$file")
	$ftprequest = [System.Net.FtpWebRequest]$ftprequest
	$ftprequest.Method = [System.Net.WebRequestMethods+Ftp]::UploadFile
	$ftprequest.Credentials = new-object System.Net.NetworkCredential($username, $password)
	$ftprequest.UseBinary = $true
	$ftprequest.UsePassive = $true
	$filecontent = gc -en byte "$local_file\$file"
	$ftprequest.ContentLength = $filecontent.Length
	$run = $ftprequest.GetRequestStream()
	$run.Write($filecontent, 0, $filecontent.Length)
	$run.Close()
	$run.Dispose()	
}
