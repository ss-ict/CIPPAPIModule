<#
.SYNOPSIS
Removes an assignment filter template from CIPP.

.DESCRIPTION
The Remove-CIPPAssignmentFilterTemplate function removes a specific assignment filter template from CIPP's template storage.

.PARAMETER ID
Specifies the ID of the assignment filter template to remove. This parameter is mandatory.

.EXAMPLE
Remove-CIPPAssignmentFilterTemplate -ID "template-12345"
Removes the specified assignment filter template.

.NOTES
This operation cannot be undone. The template will be permanently deleted from CIPP storage.
#>

function Remove-CIPPAssignmentFilterTemplate {
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ID
    )

    if ($PSCmdlet.ShouldProcess($ID, 'Remove assignment filter template')) {
        Write-Verbose "Removing assignment filter template: $ID"
        
        $endpoint = '/api/RemoveAssignmentFilterTemplate'
        $params = @{
            ID = $ID
        }

        Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method POST
    }
}
