<#
.SYNOPSIS
Retrieves mailbox permissions for a specified customer tenant and user ID.

.DESCRIPTION
The Get-CIPPMailboxPermissions function retrieves mailbox permissions for a specified customer tenant and user ID. It makes an API call to the "/api/listmailboxpermissions" endpoint with the provided parameters.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which mailbox permissions are to be retrieved. This parameter is mandatory.

.PARAMETER UserID
The ID of the user for which mailbox permissions are to be retrieved. Optional; omit to retrieve permissions for all mailboxes. Cannot be combined with -UseReportDB (the cached report only covers all mailboxes).

.PARAMETER UseReportDB
When specified, retrieves mailbox permissions from the CIPP report database cache instead of live Exchange Online data. The backend only serves cached data when no UserID is supplied. Use 'AllTenants' with this switch for cached cross-tenant data.

.EXAMPLE
Get-CIPPMailboxPermissions -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "user1@domain.com"

This example retrieves mailbox permissions for the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" and the user with ID "user1@domain.com".

.EXAMPLE
Get-CIPPMailboxPermissions -CustomerTenantID "contoso.onmicrosoft.com" -UseReportDB

This example retrieves the cached mailbox permissions report for all mailboxes in the "contoso.onmicrosoft.com" tenant from the report database.

#>

function Get-CIPPMailboxPermissions {
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

    Write-Verbose "Getting mailbox permissions for $CustomerTenantID"
    $endpoint = '/api/listmailboxpermissions'
    $params = @{
        tenantFilter = $CustomerTenantID
        userid       = $UserID
        UseReportDB  = $UseReportDB.IsPresent
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
