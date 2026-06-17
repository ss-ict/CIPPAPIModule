<#
.SYNOPSIS
Retrieves Intune device compliance policies for a specified customer tenant.

.DESCRIPTION
The Get-CIPPCompliancePolicies function retrieves Intune device compliance policies for a specified customer tenant by making a REST API call to the "/api/ListCompliancePolicies" endpoint. It can query live Microsoft Graph data or cached report database data when UseReportDB is specified.

.PARAMETER CustomerTenantID
The customer tenant ID or default domain name for which to retrieve compliance policies.

.PARAMETER UseReportDB
When specified, retrieves compliance policies from the CIPP report database cache instead of live Microsoft Graph data. Use 'AllTenants' with this switch for cached cross-tenant data.

.EXAMPLE
Get-CIPPCompliancePolicies -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves live Intune compliance policies for the "contoso.onmicrosoft.com" tenant.

.EXAMPLE
Get-CIPPCompliancePolicies -CustomerTenantID "contoso.onmicrosoft.com" -UseReportDB
Retrieves the cached Intune compliance policies for the "contoso.onmicrosoft.com" tenant from the report database.
#>
function Get-CIPPCompliancePolicies {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [switch]$UseReportDB
    )

    Write-Verbose "Getting compliance policies for $CustomerTenantID"
    $endpoint = '/api/ListCompliancePolicies'
    $params = @{
        tenantFilter = $CustomerTenantID
        UseReportDB  = $UseReportDB.IsPresent
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}
