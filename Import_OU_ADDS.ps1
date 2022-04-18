<#

.SYNOPSIS
A Simple program that will show your files on your FTP Server.

.DESCRIPTION
This one is very helpful if you want to check a file on your FTP Server.

.NOTES
for the FTP host, dont forget to use the full path example is ftp://server.com/

.LINK


#>
#Take input from ou_names file 
import-csv .\ou_names.csv | ForEach-Object {

#Assign input values to variable-ouname
 $ouname = $_."ouname"
 
 #It will search for given OU already exists in AD
  $ADOU=get-ADOrganizationalunit -Filter 'Name -like $ouname'
 
 try{

 #It will compare given OU and AD searched OU
if($ouname -eq $ADOU){

#If it already in AD, it will go to caught statement
write-host "given OU-" $ouname "is already there in AD"}

#It will create OU if not exits
else
{
 New-ADOrganizationalUnit -Name $ouname -path "DC=contoso,DC=com" -PassThru
}
}

#It will show the path of OU which already exists
catch{
write-host $ouname "is exists in AD"
write-host $ADOU
}
}
