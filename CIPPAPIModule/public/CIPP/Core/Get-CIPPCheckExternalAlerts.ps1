<#
.SYNOPSIS
Checks external alerts for CIPP extensions.

.DESCRIPTION
The Get-CIPPCheckExternalAlerts function checks for external alerts related to CIPP extensions. 
This is used to monitor the health and status of configured extensions.

.EXAMPLE
Get-CIPPCheckExternalAlerts
Retrieves all external alerts for configured CIPP extensions.

.NOTES
This function is used for monitoring extension health and connectivity.
#>

function Get-CIPPCheckExternalAlerts {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose 'Checking external alerts'
    
    $endpoint = '/api/ListCheckExtAlerts'
    $params = @{
        tenantFilter = $CustomerTenantID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Method Get -Body $params
}
