<#
.SYNOPSIS
Retrieves admin portal licenses for a specified customer tenant.

.DESCRIPTION
The Get-CIPPAdminPortalLicenses function retrieves admin portal licenses for a specified customer tenant. It uses the Invoke-CIPPRestMethod function to make a REST API call to retrieve the license information from the Microsoft Admin Portal.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which to retrieve admin portal licenses. This parameter is mandatory.

.EXAMPLE
Get-CIPPAdminPortalLicenses -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves admin portal licenses for the customer tenant "contoso.onmicrosoft.com".

.EXAMPLE
Get-CIPPAdminPortalLicenses -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves admin portal licenses for the customer tenant with the specified GUID.
#>

function Get-CIPPAdminPortalLicenses {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting admin portal licenses for tenant $CustomerTenantID"
    $endpoint = '/api/ListAdminPortalLicenses'
    $params = @{
        tenantFilter = $CustomerTenantID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}