<#
.SYNOPSIS
Retrieves directory objects by their IDs from Microsoft Graph.

.DESCRIPTION
The Get-CIPPDirectoryObjects function retrieves directory objects (users, groups, devices, etc.) by their IDs from Microsoft Graph. 
This is useful for batch lookups of multiple objects at once. You can optionally specify which properties to return.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant. This parameter is mandatory.

.PARAMETER Ids
Specifies an array of directory object IDs to retrieve. This parameter is mandatory.

.PARAMETER Select
Specifies the properties to return for each directory object. This parameter is optional. 
If not provided, all properties will be returned.

.PARAMETER AsApp
Specifies whether to use application permissions instead of delegated permissions. This parameter is optional.

.PARAMETER PartnerLookup
Specifies whether to perform a lookup in the partner tenant. This parameter is optional.

.EXAMPLE
Get-CIPPDirectoryObjects -CustomerTenantID "contoso.onmicrosoft.com" -Ids @("12345678-1234-1234-1234-123456789012", "87654321-4321-4321-4321-210987654321")
Retrieves directory objects for the specified IDs.

.EXAMPLE
Get-CIPPDirectoryObjects -CustomerTenantID "contoso.onmicrosoft.com" -Ids @("12345678-1234-1234-1234-123456789012") -Select "displayName,userPrincipalName"
Retrieves specific properties for the directory object.

.NOTES
This function uses the Microsoft Graph directoryObjects/getByIds endpoint for batch retrieval.
#>

function Get-CIPPDirectoryObjects {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string[]]$Ids,
        [Parameter(Mandatory = $false)]
        [string]$Select,
        [Parameter(Mandatory = $false)]
        [switch]$AsApp,
        [Parameter(Mandatory = $false)]
        [switch]$PartnerLookup
    )

    Write-Verbose "Retrieving directory objects for tenant: $CustomerTenantID"
    
    $endpoint = '/api/ListDirectoryObjects'
    $body = @{
        tenantFilter = $CustomerTenantID
        ids          = $Ids
    }
    
    if ($Select) {
        $body.'$select' = $Select
        Write-Verbose "Selecting properties: $Select"
    }
    
    if ($AsApp) {
        $body.asApp = $true
        Write-Verbose "Using application permissions"
    }
    
    if ($PartnerLookup) {
        $body.partnerLookup = $true
        Write-Verbose "Using partner lookup"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
