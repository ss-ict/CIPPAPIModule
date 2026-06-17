<#
.SYNOPSIS
Retrieves a list of mailboxes for a specified customer tenant ID.

.DESCRIPTION
The Get-CIPPMailboxes function retrieves a list of mailboxes for a specified customer tenant ID. It can also include soft-deleted mailboxes if the -SoftDeletedMailboxes switch is used.

.PARAMETER CustomerTenantID
Specifies the customer tenant ID for which to retrieve the mailbox list.

.PARAMETER SoftDeletedMailboxes
Indicates whether to include soft-deleted mailboxes in the result. By default, this parameter is set to $false.

.PARAMETER UseReportDB
When specified, retrieves the mailbox list from the CIPP report database cache instead of live Exchange Online data. Use 'AllTenants' with this switch for cached cross-tenant data.

.EXAMPLE
Get-CIPPMailboxes -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves the list of mailboxes for the "contoso.onmicrosoft.com" tenant.

.EXAMPLE
Get-CIPPMailboxes -CustomerTenantID "contoso.onmicrosoft.com" -SoftDeletedMailboxes
Retrieves the list of soft-deleted mailboxes for the "contoso.onmicrosoft.com" tenant.

.EXAMPLE
Get-CIPPMailboxes -CustomerTenantID "contoso.onmicrosoft.com" -UseReportDB
Retrieves the cached list of mailboxes for the "contoso.onmicrosoft.com" tenant from the report database.
#>

function Get-CIPPMailboxes {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [switch]$SoftDeletedMailboxes,
        [Parameter(Mandatory = $false)]
        [switch]$UseReportDB
    )

    Write-Verbose "Getting Mailbox List for $CustomerTenantID"
    $endpoint = '/api/ListMailboxes'
    $params = @{
        tenantFilter = $CustomerTenantID
        UseReportDB  = $UseReportDB.IsPresent
    }
    if ($SoftDeletedMailboxes) {
        $params.Add('SoftDeletedMailbox', 'true')
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
