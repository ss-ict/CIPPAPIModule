<#
.SYNOPSIS
Retrieves quarantine policies from Exchange Online.

.DESCRIPTION
The Get-CIPPQuarantinePolicy function retrieves quarantine policies from Exchange Online for a specified tenant. 
Quarantine policies define what users can do with quarantined messages.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant. This parameter is mandatory.

.PARAMETER Type
Specifies the quarantine policy type. Valid values are 'QuarantinePolicy' and 'GlobalQuarantinePolicy'. 
This parameter is optional and defaults to 'QuarantinePolicy'.

.EXAMPLE
Get-CIPPQuarantinePolicy -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves all quarantine policies for the specified tenant.

.EXAMPLE
Get-CIPPQuarantinePolicy -CustomerTenantID "contoso.onmicrosoft.com" -Type "GlobalQuarantinePolicy"
Retrieves global quarantine policies for the specified tenant.

.NOTES
This function requires appropriate Exchange Online permissions through the CIPP API.
The function enhances policy objects with additional properties for UI display:
- QuarantineNotification: Whether email notifications are enabled
- ReleaseActionPreference: Release or RequestRelease
- Builtin: Whether it's a built-in policy (GUID 00000000-0000-0000-0000-000000000000)
#>

function Get-CIPPQuarantinePolicy {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [ValidateSet('QuarantinePolicy', 'GlobalQuarantinePolicy')]
        [string]$Type = 'QuarantinePolicy'
    )

    Write-Verbose "Retrieving quarantine policies for tenant: $CustomerTenantID"
    
    $endpoint = '/api/ListQuarantinePolicy'
    $params = @{
        TenantFilter = $CustomerTenantID
        Type         = $Type
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
