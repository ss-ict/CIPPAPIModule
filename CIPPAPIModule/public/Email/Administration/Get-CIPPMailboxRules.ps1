<#
.SYNOPSIS
Retrieves mailbox rules for a specified customer tenant ID.

.DESCRIPTION
The Get-CIPPMailboxRules function retrieves mailbox rules for a specified customer tenant ID by making a REST API call to the "/api/listmailboxrules" endpoint.

.PARAMETER CustomerTenantID
The customer tenant ID for which to retrieve mailbox rules.

.PARAMETER UseReportDB
When specified, retrieves mailbox rules from the CIPP report database cache instead of live Exchange Online data. Use 'AllTenants' with this switch for cached cross-tenant data.

.EXAMPLE
Get-CIPPMailboxRules -CustomerTenantID "contoso.onmicrosoft.com"

This example retrieves mailbox rules for the customer tenant with the ID "contoso.onmicrosoft.com".

.EXAMPLE
Get-CIPPMailboxRules -CustomerTenantID "contoso.onmicrosoft.com" -UseReportDB

This example retrieves cached mailbox rules for the "contoso.onmicrosoft.com" tenant from the report database.

#>
function Get-CIPPMailboxRules {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [switch]$UseReportDB
    )

    Write-Verbose "Getting mailbox rules for $CustomerTenantID"
    $endpoint = '/api/listmailboxrules'
    $params = @{
        tenantFilter = $CustomerTenantID
        UseReportDB  = $UseReportDB.IsPresent
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
