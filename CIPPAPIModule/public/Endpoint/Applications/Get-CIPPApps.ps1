<#
.SYNOPSIS
Retrieves a list of apps for a specific customer tenant ID.

.DESCRIPTION
The Get-CIPPApps function retrieves a list of apps for a specific customer tenant ID by making a REST API call to the "/api/listapps" endpoint.

.PARAMETER CustomerTenantID
Specifies the customer tenant ID for which to retrieve the apps.

.PARAMETER UseReportDB
When specified, retrieves the application list from the CIPP report database cache instead of live Microsoft Graph data. Use 'AllTenants' with this switch for cached cross-tenant data.

.EXAMPLE
Get-CIPPApps -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves a list of apps for the customer tenant ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.EXAMPLE
Get-CIPPApps -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UseReportDB
Retrieves the cached application list for the customer tenant from the report database.

#>
function Get-CIPPApps {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [switch]$UseReportDB
    )

    Write-Verbose "Getting Apps for $CustomerTenantID"
    $Endpoint = '/api/listapps'
    $Params = @{
        tenantFilter = $CustomerTenantID
        UseReportDB  = $UseReportDB.IsPresent
    }

    Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params

}