#Takes input from users.csv file into this script

Import-Csv ".\Users.csv" | ForEach-Object {

#assign input value to variable-samAccountName 

$samAccountName = $_."samAccountName"

#get-aduser will retrieve samAccountName from domain users. if we found it will disable else it will go to catch

try { Get-ADUser -Identity $samAccountName |
Remove-ADAccount  
}

#It will run when we can't find user

catch {

#it will display the message

  Write-Host "user:"$samAccountname "is not present in AD"
}
}