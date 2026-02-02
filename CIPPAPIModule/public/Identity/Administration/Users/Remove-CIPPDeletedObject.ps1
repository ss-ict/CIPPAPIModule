<#
.SYNOPSIS
Permanently removes a deleted object from Azure AD.

.DESCRIPTION
The Remove-CIPPDeletedObject function permanently removes a deleted object (user, group, application, etc.) 
from the Azure AD recycle bin. This action is irreversible.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant. This parameter is mandatory.

.PARAMETER ID
Specifies the ID of the deleted object to permanently remove. This parameter is mandatory.

.EXAMPLE
Remove-CIPPDeletedObject -CustomerTenantID "contoso.onmicrosoft.com" -ID "12345678-1234-1234-1234-123456789012"
Permanently removes the specified deleted object from Azure AD.

.NOTES
This operation is irreversible. The object will be permanently deleted and cannot be restored.
Use with caution as this action cannot be undone.
#>

function Remove-CIPPDeletedObject {
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [guid]$ID
    )

    if ($PSCmdlet.ShouldProcess("$ID in tenant $CustomerTenantID", 'Permanently remove deleted object')) {
        Write-Verbose "Permanently removing deleted object $ID from tenant: $CustomerTenantID"
        
        $endpoint = '/api/RemoveDeletedObject'
        $body = @{
            TenantFilter = $CustomerTenantID
            ID           = $ID
        }

        Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
    }
}
