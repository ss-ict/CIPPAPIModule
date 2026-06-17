<#
.SYNOPSIS
Retrieves calendar permissions for a user in a specified customer tenant.

.DESCRIPTION
The Get-CIPPCalendarPerms function retrieves the calendar permissions for a user in a specified customer tenant using the CIPP API. It sends a request to the "/api/listcalendarpermissions" endpoint with the provided customer tenant ID and user ID.

.PARAMETER CustomerTenantID
The ID of the customer tenant.

.PARAMETER UserID
The ID of the user. Optional; omit to retrieve calendar permissions for all mailboxes. Cannot be combined with -UseReportDB (the cached report only covers all mailboxes).

.PARAMETER UseReportDB
When specified, retrieves calendar permissions from the CIPP report database cache instead of live Exchange Online data. The backend only serves cached data when no UserID is supplied. Use 'AllTenants' with this switch for cached cross-tenant data.

.EXAMPLE
Get-CIPPCalendarPerms -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "john.doe@example.com"
Retrieves the calendar permissions for the user "john.doe@example.com" in the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.EXAMPLE
Get-CIPPCalendarPerms -CustomerTenantID "contoso.onmicrosoft.com" -UseReportDB
Retrieves the cached calendar permissions report for all mailboxes in the "contoso.onmicrosoft.com" tenant from the report database.

#>

function Get-CIPPCalendarPerms {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [string]$UserID,
        [Parameter(Mandatory = $false)]
        [switch]$UseReportDB
    )

    if ($UserID -and $UseReportDB) {
        throw 'Parameter combination is not valid. -UseReportDB returns the cached report for all mailboxes and cannot be combined with -UserID.'
    }

    Write-Verbose "Getting user calendar permissions for user: $UserID"
    $Endpoint = '/api/listcalendarpermissions'
    $Params = @{
        tenantFilter = $CustomerTenantID
        userId       = $UserID
        UseReportDB  = $UseReportDB.IsPresent
    }
    Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params
}
