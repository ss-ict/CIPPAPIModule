<#
.SYNOPSIS
Retrieves Just-In-Time (JIT) admin users from Azure AD.

.DESCRIPTION
The Get-CIPPJITAdmin function retrieves users with Just-In-Time admin access configured in Azure AD. 
JIT admin provides temporary elevated permissions that expire automatically. 
You can retrieve JIT admin users for a specific tenant or all tenants.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant. This parameter is mandatory.
Use "AllTenants" to retrieve JIT admin users across all managed tenants.

.EXAMPLE
Get-CIPPJITAdmin -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves JIT admin users for the specified tenant.

.EXAMPLE
Get-CIPPJITAdmin -CustomerTenantID "AllTenants"
Retrieves JIT admin users for all managed tenants. This operation may take several minutes and uses a queue-based approach.

.NOTES
This function queries the CIPP schema extensions to identify users with JIT admin settings.
When using "AllTenants", results are cached for 60 minutes and the operation runs asynchronously via a queue.
#>

function Get-CIPPJITAdmin {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Retrieving JIT admin users for tenant: $CustomerTenantID"
    
    $endpoint = '/api/ListJITAdmin'
    $params = @{
        TenantFilter = $CustomerTenantID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
