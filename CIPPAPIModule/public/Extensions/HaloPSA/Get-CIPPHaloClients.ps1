<#
.SYNOPSIS
Retrieves client list from HaloPSA integration.

.DESCRIPTION
The Get-CIPPHaloClients function retrieves the list of clients from the configured HaloPSA integration. 
This is used for mapping CIPP tenants to HaloPSA clients.

.EXAMPLE
Get-CIPPHaloClients
Retrieves all clients from HaloPSA.

.NOTES
This function requires HaloPSA extension to be configured in CIPP.
#>

function Get-CIPPHaloClients {
    [CmdletBinding()]
    param ()

    Write-Verbose "Retrieving HaloPSA clients"
    
    $endpoint = '/api/ListHaloClients'

    Invoke-CIPPRestMethod -Endpoint $endpoint
}
