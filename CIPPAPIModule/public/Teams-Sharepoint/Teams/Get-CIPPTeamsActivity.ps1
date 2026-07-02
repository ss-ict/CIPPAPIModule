<#
.SYNOPSIS
Retrieves the activity of Teams users in a specified customer tenant.

.DESCRIPTION
The Get-CIPPTeamsActivity function retrieves the activity of Teams users in a specified customer tenant. It makes use of the Invoke-CIPPRestMethod function to send a request to the "/api/listteamsactivity" endpoint with the provided parameters.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which to retrieve the Teams activity.

.PARAMETER UseReportDB
When specified, retrieves the Teams activity report from the CIPP report database cache instead of live data. Use 'AllTenants' with this switch for cached cross-tenant data.

.EXAMPLE
Get-CIPPTeamsActivity -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves the Teams activity for the customer tenant with the ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.EXAMPLE
Get-CIPPTeamsActivity -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UseReportDB
Retrieves the cached Teams activity report for the customer tenant from the report database.

#>
function Get-CIPPTeamsActivity {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [switch]$UseReportDB
    )

    Write-Verbose "Getting teams activity $CustomerTenantID"
    $endpoint = '/api/listteamsactivity'
    $params = @{
        tenantFilter = $CustomerTenantID
        type         = 'TeamsUserActivityUser'
        UseReportDB  = $UseReportDB.IsPresent
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
