<#
.SYNOPSIS
Retrieves tenant drift data for standards configuration.

.DESCRIPTION
The Get-CIPPTenantDrift function retrieves drift data that shows changes or deviations from applied standards 
in managed tenants. This helps identify configuration drift over time.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant to check for drift. This parameter is optional. 
If not provided, drift data for all tenants will be retrieved.

.EXAMPLE
Get-CIPPTenantDrift
Retrieves drift data for all managed tenants.

.EXAMPLE
Get-CIPPTenantDrift -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves drift data for a specific tenant.

.NOTES
This function helps identify when tenant configurations have drifted from applied standards.
Drift detection is useful for maintaining compliance and consistency across tenants.
#>

function Get-CIPPTenantDrift {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Retrieving tenant drift data"
    
    $endpoint = '/api/ListTenantDrift'
    $params = @{}
    
    if ($CustomerTenantID) {
        $params.TenantFilter = $CustomerTenantID
        Write-Verbose "Filtering by tenant: $CustomerTenantID"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
