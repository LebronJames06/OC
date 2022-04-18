<#

.SYNOPSIS
A Simple program for printer and printing management.

.DESCRIPTION
It has a functions of getting the default printer, list all the printer, set a default printer and print a document.

.NOTES
For the printer name it must complete name in order to used it.
Make sure the you have a folder name printer and put the file you want to print.
and if you as for the filename that you want to print put the filename plus the extention.

.LINK


#>
function get_list_printer(){
Get-Printer | Select Name 
}

function get_default_Printer(){
Get-CimInstance -ClassName CIM_Printer | WHERE {$_.Default -eq $True} | Format-Table -AutoSize
}

function set_default_printer(){
$printer_name = Read-Host -Prompt "Type your complete name of your printer: "		
$printer = (Get-CimInstance -ClassName CIM_Printer | WHERE {$_.Name -eq $printer_name}[0])
$printer | Invoke-CimMethod -MethodName SetDefaultPrinter | Out-Null
}

function print_document(){
$file = Read-Host -Prompt "Type your complete file that you want print: "		
Get-Content -Path ./printer/$file | Out-Printer
Start-Process -FilePath ./printer/$file -Verb print
}


Write-Host "1-Show default printer"
Write-Host "2-List all the printers"
Write-Host "3-Changed the default printer"
Write-Host "4-Print a file"


$item_number = Read-Host -Prompt "Enter the number to run a command"

switch ($item_number) {
1 {get_default_Printer}
2 {get_list_printer}
3 {set_default_printer}
4 {print_document}
}