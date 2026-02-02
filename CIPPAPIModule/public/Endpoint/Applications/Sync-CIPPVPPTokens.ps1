<#
.SYNOPSIS
Synchronizes VPP (Volume Purchase Program) tokens for a specified customer tenant.

.DESCRIPTION
The Sync-CIPPVPPTokens function synchronizes VPP (Volume Purchase Program) tokens for a specified customer tenant. It uses the Invoke-CIPPRestMethod function to make a REST API call to start the VPP sync process for all valid VPP tokens in the tenant.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which to synchronize VPP tokens. This parameter is mandatory.

.EXAMPLE
Sync-CIPPVPPTokens -CustomerTenantID "contoso.onmicrosoft.com"
Synchronizes VPP tokens for the customer tenant "contoso.onmicrosoft.com".

.EXAMPLE
Sync-CIPPVPPTokens -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Synchronizes VPP tokens for the customer tenant with the specified GUID.
#>

function Sync-CIPPVPPTokens {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Starting VPP sync for tenant $CustomerTenantID"
    $endpoint = '/api/ExecSyncVPP'
    $body = @{
        tenantFilter = $CustomerTenantID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method 'POST'
}