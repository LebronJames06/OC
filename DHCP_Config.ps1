<#
.SYNOPSIS
A Simple command that will add DHCP records to the AD-DS server.
.DESCRIPTION
Import DHCP record using CSV file
.NOTES
make sure that you have a CSV name dhcp.csv on the root of this file and save your dhcp record there in order to run it properly.
.LINK
#>
$Scopes = Import-Csv -Path "./DHCP-Scopes.csv"

foreach($Scope in $Scopes) {
    Set-DhcpServerv4Scope -ScopeId $Scope.ScopeId `
                          -Name $Scope.Name `
                          -Description $Scope.Description
}