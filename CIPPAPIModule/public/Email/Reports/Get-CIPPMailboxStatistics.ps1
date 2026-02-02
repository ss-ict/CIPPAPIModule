<#
.SYNOPSIS
Retrieves mailbox usage statistics for a specified customer tenant over a given time period.

.DESCRIPTION
The Get-CIPPMailboxStatistics function queries mailbox usage details for a customer tenant using the Microsoft Graph API. 
It allows specifying the tenant ID and an optional time period (D7, D30, D90, D180) to filter the statistics.

.PARAMETER CustomerTenantID
The unique identifier of the customer tenant for which mailbox statistics are to be retrieved.

.PARAMETER TimePeriod
(Optional) The time period for mailbox usage statistics. Valid values are 'D7', 'D30', 'D90', 'D180'. Defaults to 'D7'.

.EXAMPLE
Get-CIPPMailboxStatistics -CustomerTenantID "contoso.onmicrosoft.com" -TimePeriod "D30"

#>
function Get-CIPPMailboxStatistics {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID, 
        [Parameter(Mandatory = $false)]
        [ValidateSet('D7', 'D30', 'D90', 'D180')]
        [string]$TimePeriod = 'D7'
    )

    Write-Verbose "Getting mailbox statistics for $CustomerTenantID for the last $TimePeriod days."
    $endpoint = '/api/ListGraphRequest'
    $params = @{
        tenantFilter = $CustomerTenantID
        Endpoint     = "reports/getMailboxUsageDetail(period='$TimePeriod')"
        '$format'    = 'application/json'
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}