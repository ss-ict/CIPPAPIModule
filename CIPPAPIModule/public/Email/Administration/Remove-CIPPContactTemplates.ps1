<#
.SYNOPSIS
Removes a contact template from CIPP.

.DESCRIPTION
The Remove-CIPPContactTemplates function removes a specific contact template from CIPP's template storage.

.PARAMETER ID
Specifies the ID of the contact template to remove. This parameter is mandatory.

.EXAMPLE
Remove-CIPPContactTemplates -ID "StandardContact.ContactTemplate.json"
Removes the specified contact template.

.NOTES
This operation cannot be undone. The template will be permanently deleted from CIPP storage.
#>

function Remove-CIPPContactTemplates {
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ID
    )

    if ($PSCmdlet.ShouldProcess($ID, 'Remove contact template')) {
        Write-Verbose "Removing contact template: $ID"
        
        $endpoint = '/api/RemoveContactTemplates'
        $params = @{
            ID = $ID
        }

        Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method POST
    }
}
