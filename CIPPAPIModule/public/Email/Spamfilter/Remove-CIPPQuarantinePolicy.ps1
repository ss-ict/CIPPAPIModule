<#
.SYNOPSIS
Removes a quarantine policy from Exchange Online.

.DESCRIPTION
The Remove-CIPPQuarantinePolicy function removes a quarantine policy from Exchange Online for a specified tenant.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant. This parameter is mandatory.

.PARAMETER Name
Specifies the name of the quarantine policy to remove. This parameter is mandatory.

.PARAMETER Identity
Specifies the identity (GUID) of the quarantine policy. This parameter is mandatory.

.EXAMPLE
Remove-CIPPQuarantinePolicy -CustomerTenantID "contoso.onmicrosoft.com" -Name "CustomPolicy" -Identity "12345678-1234-1234-1234-123456789012"
Removes the specified quarantine policy.

.NOTES
Built-in quarantine policies (with Identity 00000000-0000-0000-0000-000000000000) cannot be removed.
This operation requires appropriate Exchange Online permissions through the CIPP API.
#>

function Remove-CIPPQuarantinePolicy {
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$Name,
        [Parameter(Mandatory = $true)]
        [guid]$Identity
    )

    if ($PSCmdlet.ShouldProcess("$Name in tenant $CustomerTenantID", 'Remove quarantine policy')) {
        Write-Verbose "Removing quarantine policy $Name from tenant: $CustomerTenantID"
        
        $endpoint = '/api/RemoveQuarantinePolicy'
        $body = @{
            TenantFilter = $CustomerTenantID
            Name         = $Name
            Identity     = $Identity
        }

        Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
    }
}
