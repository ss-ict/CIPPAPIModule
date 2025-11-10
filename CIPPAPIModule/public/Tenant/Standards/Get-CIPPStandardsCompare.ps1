<#
.SYNOPSIS
Retrieves and compares applied standards across tenants.

.DESCRIPTION
The Get-CIPPStandardsCompare function retrieves the current state of applied standards across all managed tenants 
or a specific tenant. This allows you to compare which standards are applied and their configurations.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant to filter results. This parameter is optional. 
If not provided, standards for all tenants will be retrieved.

.EXAMPLE
Get-CIPPStandardsCompare
Retrieves applied standards for all managed tenants.

.EXAMPLE
Get-CIPPStandardsCompare -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves applied standards for a specific tenant.

.NOTES
This function retrieves standards reports from the CippStandardsReports table.
Each standard's value and last refresh time are included in the results.
#>

function Get-CIPPStandardsCompare {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Retrieving standards comparison"
    
    $endpoint = '/api/ListStandardsCompare'
    $params = @{}
    
    if ($CustomerTenantID) {
        $params.tenantFilter = $CustomerTenantID
        Write-Verbose "Filtering by tenant: $CustomerTenantID"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
