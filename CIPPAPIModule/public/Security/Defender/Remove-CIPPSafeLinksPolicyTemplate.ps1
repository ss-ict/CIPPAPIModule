<#
.SYNOPSIS
Removes a Safe Links policy template from CIPP.

.DESCRIPTION
The Remove-CIPPSafeLinksPolicyTemplate function removes a specific Safe Links policy template from CIPP's template storage.

.PARAMETER ID
Specifies the ID of the Safe Links policy template to remove. This parameter is mandatory.

.EXAMPLE
Remove-CIPPSafeLinksPolicyTemplate -ID "StandardProtection.SafeLinksTemplate.json"
Removes the specified Safe Links policy template.

.NOTES
This operation cannot be undone. The template will be permanently deleted from CIPP storage.
#>

function Remove-CIPPSafeLinksPolicyTemplate {
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ID
    )

    if ($PSCmdlet.ShouldProcess($ID, 'Remove Safe Links policy template')) {
        Write-Verbose "Removing Safe Links policy template: $ID"
        
        $endpoint = '/api/RemoveSafeLinksPolicyTemplate'
        $params = @{
            ID = $ID
        }

        Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method POST
    }
}
