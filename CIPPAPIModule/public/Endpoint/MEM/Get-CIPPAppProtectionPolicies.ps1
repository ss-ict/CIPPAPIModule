<#
.SYNOPSIS
Retrieves Intune app protection policies for a specified customer tenant.

.DESCRIPTION
The Get-CIPPAppProtectionPolicies function retrieves Intune app protection (MAM) policies for a specified customer tenant by making a REST API call to the "/api/ListAppProtectionPolicies" endpoint. It can query live Microsoft Graph data or cached report database data when UseReportDB is specified.

.PARAMETER CustomerTenantID
The customer tenant ID or default domain name for which to retrieve app protection policies.

.PARAMETER UseReportDB
When specified, retrieves app protection policies from the CIPP report database cache instead of live Microsoft Graph data. Use 'AllTenants' with this switch for cached cross-tenant data.

.EXAMPLE
Get-CIPPAppProtectionPolicies -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves live Intune app protection policies for the "contoso.onmicrosoft.com" tenant.

.EXAMPLE
Get-CIPPAppProtectionPolicies -CustomerTenantID "contoso.onmicrosoft.com" -UseReportDB
Retrieves the cached Intune app protection policies for the "contoso.onmicrosoft.com" tenant from the report database.
#>
function Get-CIPPAppProtectionPolicies {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [switch]$UseReportDB
    )

    Write-Verbose "Getting app protection policies for $CustomerTenantID"
    $endpoint = '/api/ListAppProtectionPolicies'
    $params = @{
        tenantFilter = $CustomerTenantID
        UseReportDB  = $UseReportDB.IsPresent
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}
