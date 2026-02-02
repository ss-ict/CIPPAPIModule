<#
.SYNOPSIS
Retrieves the SharePoint admin URL for a tenant.

.DESCRIPTION
The Get-CIPPSharepointAdminUrl function retrieves the SharePoint admin center URL for a specified tenant. 
You can optionally return the URL as data or be redirected to the SharePoint admin center.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant. This parameter is mandatory.

.PARAMETER ReturnUrl
Specifies whether to return the URL as data instead of redirecting. This parameter is optional.

.EXAMPLE
Get-CIPPSharepointAdminUrl -CustomerTenantID "contoso.onmicrosoft.com" -ReturnUrl
Retrieves the SharePoint admin URL for the specified tenant and returns it as data.

.EXAMPLE
Get-CIPPSharepointAdminUrl -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves the SharePoint admin URL and initiates a redirect to the SharePoint admin center.

.NOTES
This function caches the SharePoint admin URL in the tenant table for improved performance.
When ReturnUrl is not specified, the function returns an HTTP redirect response.
#>

function Get-CIPPSharepointAdminUrl {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [switch]$ReturnUrl
    )

    Write-Verbose "Retrieving SharePoint admin URL for tenant: $CustomerTenantID"
    
    $endpoint = '/api/ListSharepointAdminUrl'
    $params = @{
        TenantFilter = $CustomerTenantID
    }
    
    if ($ReturnUrl) {
        $params.ReturnUrl = $true
        Write-Verbose "Returning URL as data"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
