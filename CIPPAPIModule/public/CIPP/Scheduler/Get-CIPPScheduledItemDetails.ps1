<#
.SYNOPSIS
Retrieves detailed information about a scheduled item.

.DESCRIPTION
The Get-CIPPScheduledItemDetails function retrieves detailed information about a specific scheduled task in CIPP, 
including the task configuration, execution history, and results for each tenant.

.PARAMETER RowKey
Specifies the RowKey (ID) of the scheduled item. This parameter is mandatory.

.EXAMPLE
Get-CIPPScheduledItemDetails -RowKey "12345678-1234-1234-1234-123456789012"
Retrieves detailed information for the specified scheduled item.

.NOTES
This function returns comprehensive details including:
- Task configuration (name, command, parameters, recurrence)
- Execution times (scheduled, last executed)
- Results for each tenant where the task was executed
- Tenant group information if applicable
#>

function Get-CIPPScheduledItemDetails {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$RowKey
    )

    Write-Verbose "Retrieving scheduled item details for: $RowKey"
    
    $endpoint = '/api/ListScheduledItemDetails'
    $params = @{
        RowKey = $RowKey
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
