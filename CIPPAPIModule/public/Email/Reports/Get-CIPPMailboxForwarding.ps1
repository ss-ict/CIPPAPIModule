<#
.SYNOPSIS
Retrieves mailbox forwarding configuration for a specified customer tenant.

.DESCRIPTION
The Get-CIPPMailboxForwarding function retrieves mailbox forwarding configuration for a specified customer tenant by making a REST API call to the "/api/ListMailboxForwarding" endpoint. It can query live Exchange Online data or cached report database data when UseReportDB is specified.

.PARAMETER CustomerTenantID
The customer tenant ID or default domain name for which to retrieve mailbox forwarding configuration.

.PARAMETER UseReportDB
When specified, retrieves mailbox forwarding configuration from the CIPP report database cache instead of live Exchange Online data. Use 'AllTenants' with this switch for cached cross-tenant data.

.EXAMPLE
Get-CIPPMailboxForwarding -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves live mailbox forwarding configuration for the "contoso.onmicrosoft.com" tenant.

.EXAMPLE
Get-CIPPMailboxForwarding -CustomerTenantID "contoso.onmicrosoft.com" -UseReportDB
Retrieves the cached mailbox forwarding report for the "contoso.onmicrosoft.com" tenant from the report database.
#>
function Get-CIPPMailboxForwarding {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [switch]$UseReportDB
    )

    Write-Verbose "Getting mailbox forwarding for $CustomerTenantID"
    $endpoint = '/api/ListMailboxForwarding'
    $params = @{
        tenantFilter = $CustomerTenantID
        UseReportDB  = $UseReportDB.IsPresent
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}
