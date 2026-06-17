<#
.SYNOPSIS
Retrieves High Volume Email (HVE) accounts for a specified customer tenant.

.DESCRIPTION
The Get-CIPPHVEAccounts function retrieves High Volume Email (HVE) accounts for a specified customer tenant by making a REST API call to the "/api/ListHVEAccounts" endpoint. It can query live data or cached report database data when UseReportDB is specified.

.PARAMETER CustomerTenantID
The customer tenant ID or default domain name for which to retrieve HVE accounts.

.PARAMETER UseReportDB
When specified, retrieves HVE accounts from the CIPP report database cache instead of live data. Use 'AllTenants' with this switch for cached cross-tenant data.

.EXAMPLE
Get-CIPPHVEAccounts -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves live HVE accounts for the "contoso.onmicrosoft.com" tenant.

.EXAMPLE
Get-CIPPHVEAccounts -CustomerTenantID "contoso.onmicrosoft.com" -UseReportDB
Retrieves the cached HVE accounts for the "contoso.onmicrosoft.com" tenant from the report database.
#>
function Get-CIPPHVEAccounts {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [switch]$UseReportDB
    )

    Write-Verbose "Getting HVE accounts for $CustomerTenantID"
    $endpoint = '/api/ListHVEAccounts'
    $params = @{
        tenantFilter = $CustomerTenantID
        UseReportDB  = $UseReportDB.IsPresent
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}
