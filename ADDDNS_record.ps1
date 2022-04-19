<#
.SYNOPSIS
A Simple command that will add DNS records to the AD-DS server.
.DESCRIPTION
Import DNS record using CSV file
.NOTES
make sure that you have a CSV name dns.csv on the root of this file and save your DNS record there in order to run it properly.
.LINK
#>
$Records = Import-Csv -Path "./dns.csv" -Delimiter ';'
foreach($Record in $Records) {
    Add-DnsServerResourceRecordA -ComputerName "dns.company.local" `
                                 -Name $Record.Name `
                                 -ZoneName "company.local" `
                                 -IPv4Address $Record.IPv4Address `
                                 -CreatePtr `
                                 -Confirm:$false
}