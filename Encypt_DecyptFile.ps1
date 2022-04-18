<#

.SYNOPSIS
A simple program that will encypt and decrypt a message.
I found this command in windows documention and internet.

.DESCRIPTION
It has 3 functions
1. Show all files that stored as decrypted. 
2. Create a self signed certificate_details.
3  Show details of self signed certificate.

.NOTES
Dont forget your Key you will used it to encypt and decrypt the message.
Use only the file name and dont add the extention in the input.

.LINK


#>
function self_signed_certificate(){
$key = Read-Host -Prompt "Type your desired key:"	
New-SelfSignedCertificate -DnsName $key -CertStoreLocation "Cert:\CurrentUser\My" -KeyUsage KeyEncipherment,DataEncipherment, KeyAgreement -Type DocumentEncryptionCert
}

function certificate_details(){
Get-Childitem -Path Cert:\CurrentUser\My -DocumentEncryptionCert	
}

function file_encryption(){
$message = Read-Host -Prompt "Type your secret message you want to encypt:"	
$key = Read-Host -Prompt "Type your key:"	
$file = Read-Host -Prompt "Type your filename:"	
$message | Protect-CmsMessage -To cn=$key -OutFile .\SECRET-MESSAGES\$file.txt
}

function disable_file_encryption(){
$file_name = Read-Host -Prompt "File name you want to decrypted"
Unprotect-CmsMessage -Path .\SECRET-MESSAGES\$file_name.txt
}

function show_files(){
Get-ChildItem -Path .\SECRET-MESSAGES\ -Force -ErrorAction SilentlyContinue | Out-Host 

Write-Host "1-Encypt the message"
Write-Host "2-Decrypted the message"

$item_number = Read-Host -Prompt "Enter the number to run a command"
switch ($item_number) {
1 {file_encryption}
2 {disable_file_encryption}
}

}

Write-Host "1-Show all files decrypted"
Write-Host "2-Create a Self-Signed Certificate"
Write-Host "3-View Certificate Details"


$item_number = Read-Host -Prompt "Enter the number to run a command"

switch ($item_number) {
1 {show_files}
2 {self_signed_certificate}
3 {certificate_details}
}