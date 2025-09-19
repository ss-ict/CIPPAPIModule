<#
.SYNOPSIS
Removes a SharePoint site from a specified customer tenant.

.DESCRIPTION
The Remove-CIPPSharePointSite function removes a SharePoint site from a specified customer tenant. It uses the Invoke-CIPPRestMethod function to make a REST API call to delete the site. The function handles both regular SharePoint sites and group-connected sites automatically.

.PARAMETER CustomerTenantID
The ID of the customer tenant from which to remove the SharePoint site. This parameter is mandatory.

.PARAMETER SiteId
The ID of the SharePoint site to remove. This must be a valid GUID. This parameter is mandatory.

.EXAMPLE
Remove-CIPPSharePointSite -CustomerTenantID "contoso.onmicrosoft.com" -SiteId "12345678-1234-1234-1234-123456789abc"
Removes the SharePoint site with the specified ID from the customer tenant "contoso.onmicrosoft.com".

.EXAMPLE
Remove-CIPPSharePointSite -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -SiteId "87654321-4321-4321-4321-cba987654321"
Removes the SharePoint site with the specified ID from the customer tenant with the given GUID.
#>

function Remove-CIPPSharePointSite {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [guid]$SiteId
    )

    Write-Verbose "Removing SharePoint site $SiteId for tenant $CustomerTenantID"
    $endpoint = '/api/DeleteSharepointSite'
    $body = @{
        tenantFilter = $CustomerTenantID
        SiteId       = $SiteId.ToString()
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method 'POST'
}