<#
.SYNOPSIS
Removes a queued alert from CIPP.

.DESCRIPTION
The Remove-CIPPQueuedAlert function removes a specific queued alert from CIPP's alert queue.

.PARAMETER ID
Specifies the ID of the queued alert to remove. This parameter is mandatory.

.EXAMPLE
Remove-CIPPQueuedAlert -ID "alert-12345"
Removes the specified queued alert.

.NOTES
This operation removes the alert from the queue and it will no longer be processed.
#>

function Remove-CIPPQueuedAlert {
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ID
    )

    if ($PSCmdlet.ShouldProcess($ID, 'Remove queued alert')) {
        Write-Verbose "Removing queued alert: $ID"
        
        $endpoint = '/api/RemoveQueuedAlert'
        $params = @{
            ID = $ID
        }

        Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method POST
    }
}
