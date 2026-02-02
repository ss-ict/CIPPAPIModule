<#
.SYNOPSIS
Retrieves assignment filters from Microsoft Endpoint Manager.

.DESCRIPTION
The Get-CIPPAssignmentFilters function retrieves assignment filters from Microsoft Endpoint Manager (Intune) for a specified tenant. 
You can retrieve all assignment filters or a specific filter by providing its ID.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant. This parameter is mandatory.

.PARAMETER FilterId
Specifies the ID of a specific assignment filter to retrieve. This parameter is optional. 
If not provided, all assignment filters will be retrieved.

.EXAMPLE
Get-CIPPAssignmentFilters -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves all assignment filters for the specified tenant.

.EXAMPLE
Get-CIPPAssignmentFilters -CustomerTenantID "contoso.onmicrosoft.com" -FilterId "12345678-1234-1234-1234-123456789012"
Retrieves a specific assignment filter by its ID for the specified tenant.

.NOTES
This function requires appropriate permissions to access Microsoft Endpoint Manager data through the CIPP API.
#>

function Get-CIPPAssignmentFilters {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [guid]$FilterId
    )

    Write-Verbose "Retrieving assignment filters for tenant: $CustomerTenantID"
    
    $endpoint = '/api/ListAssignmentFilters'
    $params = @{
        tenantFilter = $CustomerTenantID
    }
    
    if ($FilterId) {
        $params.filterId = $FilterId
        Write-Verbose "Retrieving specific filter: $FilterId"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
