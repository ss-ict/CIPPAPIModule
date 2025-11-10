<#
.SYNOPSIS
Removes a scheduled item from CIPP.

.DESCRIPTION
The Remove-CIPPScheduledItem function removes a scheduled task from CIPP's scheduler. 
This includes removing both the task entry and its associated details.

.PARAMETER ID
Specifies the ID (RowKey) of the scheduled item to remove. This parameter is mandatory.

.EXAMPLE
Remove-CIPPScheduledItem -ID "12345678-1234-1234-1234-123456789012"
Removes the specified scheduled item.

.NOTES
This operation removes the scheduled task and all associated details.
The task will no longer execute after removal.
#>

function Remove-CIPPScheduledItem {
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ID
    )

    if ($PSCmdlet.ShouldProcess($ID, 'Remove scheduled item')) {
        Write-Verbose "Removing scheduled item: $ID"
        
        $endpoint = '/api/RemoveScheduledItem'
        $params = @{
            id = $ID
        }

        Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method POST
    }
}
