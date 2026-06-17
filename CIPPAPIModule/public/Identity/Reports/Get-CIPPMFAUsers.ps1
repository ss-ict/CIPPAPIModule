<#
.SYNOPSIS
Retrieves the MFA users for a specified customer tenant ID.

.DESCRIPTION
The Get-CIPPMFAUsers function retrieves the MFA users for a specified customer tenant ID by making a REST API call to the "/api/listmfausers" endpoint.

.PARAMETER CustomerTenantID
Specifies the customer tenant ID for which to retrieve the MFA users.

.PARAMETER UseReportDB
When specified, retrieves the MFA user report from the CIPP report database cache instead of live Microsoft Graph data. Use 'AllTenants' with this switch for cached cross-tenant data.

.EXAMPLE
Get-CIPPMFAUsers -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves the MFA users for the customer tenant ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.EXAMPLE
Get-CIPPMFAUsers -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UseReportDB
Retrieves the cached MFA user report for the customer tenant from the report database.

#>
function Get-CIPPMFAUsers {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [switch]$UseReportDB
    )

    Write-Verbose "Getting MFA users for $CustomerTenantID"
    $endpoint = '/api/listmfausers'
    $params = @{
        tenantFilter = $CustomerTenantID
        UseReportDB  = $UseReportDB.IsPresent
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}