<#
.SYNOPSIS
Retrieves teams voice information for a specified customer tenant ID.

.DESCRIPTION
The Get-CIPPTeamsVoice function retrieves teams voice information for a specified customer tenant ID. It makes use of the Invoke-CIPPRestMethod function to send a request to the "/api/listteamsvoice" endpoint with the provided tenant filter.

.PARAMETER CustomerTenantID
The customer tenant ID for which to retrieve teams voice information. This parameter is mandatory.

.PARAMETER UseReportDB
When specified, retrieves Teams voice information from the CIPP report database cache instead of live data. Use 'AllTenants' with this switch for cached cross-tenant data.

.EXAMPLE
Get-CIPPTeamsVoice -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves teams voice information for the customer tenant with the ID "contoso.onmicrosoft.com".

.EXAMPLE
Get-CIPPTeamsVoice -CustomerTenantID "contoso.onmicrosoft.com" -UseReportDB
Retrieves cached Teams voice information for the "contoso.onmicrosoft.com" tenant from the report database.

#>
function Get-CIPPTeamsVoice {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [switch]$UseReportDB
    )

    Write-Verbose "Getting teams voice $CustomerTenantID"
    $endpoint = '/api/listteamsvoice'
    $params = @{
        tenantFilter = $CustomerTenantID
        UseReportDB  = $UseReportDB.IsPresent
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
