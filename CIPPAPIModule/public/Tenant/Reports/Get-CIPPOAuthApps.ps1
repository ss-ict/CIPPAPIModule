<#
.SYNOPSIS
Retrieves OAuth apps for a specific customer tenant.

.DESCRIPTION
The Get-CIPPOAuthApps function retrieves OAuth apps for a specific customer tenant by making a REST API call to the "/api/listoauthapps" endpoint.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which to retrieve OAuth apps.

.PARAMETER UseReportDB
When specified, retrieves OAuth apps from the CIPP report database cache instead of live Microsoft Graph data. Use 'AllTenants' with this switch for cached cross-tenant data.

.EXAMPLE
Get-CIPPOAuthApps -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves OAuth apps for the customer tenant with the ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.EXAMPLE
Get-CIPPOAuthApps -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UseReportDB
Retrieves cached OAuth apps for the customer tenant from the report database.

#>
function Get-CIPPOAuthApps {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [switch]$UseReportDB
    )

    Write-Verbose "Getting OAuth apps for $CustomerTenantID"
    $endpoint = '/api/listoauthapps'
    $params = @{
        tenantFilter = $CustomerTenantID
        UseReportDB  = $UseReportDB.IsPresent
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}