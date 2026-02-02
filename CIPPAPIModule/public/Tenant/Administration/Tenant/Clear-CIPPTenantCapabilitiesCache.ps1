<#
.SYNOPSIS
Removes cached tenant capabilities data from CIPP.

.DESCRIPTION
The Clear-CIPPTenantCapabilitiesCache function clears the cached tenant capabilities data for a specified tenant. 
This forces CIPP to refresh the capabilities information on the next request.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant. This parameter is mandatory.

.EXAMPLE
Clear-CIPPTenantCapabilitiesCache -CustomerTenantID "contoso.onmicrosoft.com"
Clears the capabilities cache for the specified tenant.

.NOTES
Clearing the cache will cause the capabilities to be re-evaluated on the next access.
This is useful when tenant features or licenses have changed.
#>

function Clear-CIPPTenantCapabilitiesCache {
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    if ($PSCmdlet.ShouldProcess($CustomerTenantID, 'Remove tenant capabilities cache')) {
        Write-Verbose "Removing capabilities cache for tenant: $CustomerTenantID"
        
        $endpoint = '/api/RemoveTenantCapabilitiesCache'
        $body = @{
            TenantFilter = $CustomerTenantID
        }

        Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
    }
}
