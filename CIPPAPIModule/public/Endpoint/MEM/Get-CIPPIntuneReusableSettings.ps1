<#
.SYNOPSIS
Retrieves Intune reusable settings for a specified customer tenant.

.DESCRIPTION
The Get-CIPPIntuneReusableSettings function retrieves Intune reusable policy settings for a specified customer tenant by making a REST API call to the "/api/ListIntuneReusableSettings" endpoint. It can query live Microsoft Graph data or cached report database data when UseReportDB is specified.

.PARAMETER CustomerTenantID
The customer tenant ID or default domain name for which to retrieve reusable settings.

.PARAMETER UseReportDB
When specified, retrieves reusable settings from the CIPP report database cache instead of live Microsoft Graph data. Use 'AllTenants' with this switch for cached cross-tenant data.

.EXAMPLE
Get-CIPPIntuneReusableSettings -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves live Intune reusable settings for the "contoso.onmicrosoft.com" tenant.

.EXAMPLE
Get-CIPPIntuneReusableSettings -CustomerTenantID "contoso.onmicrosoft.com" -UseReportDB
Retrieves the cached Intune reusable settings for the "contoso.onmicrosoft.com" tenant from the report database.
#>
function Get-CIPPIntuneReusableSettings {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [switch]$UseReportDB
    )

    Write-Verbose "Getting Intune reusable settings for $CustomerTenantID"
    $endpoint = '/api/ListIntuneReusableSettings'
    $params = @{
        tenantFilter = $CustomerTenantID
        UseReportDB  = $UseReportDB.IsPresent
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}
