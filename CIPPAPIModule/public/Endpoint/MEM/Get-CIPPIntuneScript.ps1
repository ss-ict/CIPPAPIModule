<#
.SYNOPSIS
Retrieves Intune scripts from Microsoft Endpoint Manager.

.DESCRIPTION
The Get-CIPPIntuneScript function retrieves Intune scripts (including PowerShell, shell scripts, remediation scripts, and Linux scripts) 
from Microsoft Endpoint Manager for a specified tenant. The function retrieves all script types in a single operation.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant. This parameter is mandatory.

.EXAMPLE
Get-CIPPIntuneScript -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves all Intune scripts for the specified tenant, including Windows PowerShell scripts, macOS shell scripts, remediation scripts, and Linux configuration scripts.

.NOTES
This function retrieves the following script types:
- Windows: Device management PowerShell scripts
- MacOS: Device shell scripts
- Remediation: Device health scripts (proactive remediations)
- Linux: Configuration policy scripts

This function requires appropriate permissions to access Microsoft Endpoint Manager data through the CIPP API.
#>

function Get-CIPPIntuneScript {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Retrieving Intune scripts for tenant: $CustomerTenantID"
    
    $endpoint = '/api/ListIntuneScript'
    $params = @{
        tenantFilter = $CustomerTenantID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
