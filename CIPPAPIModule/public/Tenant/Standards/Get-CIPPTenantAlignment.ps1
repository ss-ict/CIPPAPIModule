<#
.SYNOPSIS
Retrieves tenant alignment scores for applied standards.

.DESCRIPTION
The Get-CIPPTenantAlignment function retrieves alignment scores that indicate how well tenants are aligned 
with the applied standards. This includes alignment scores, license missing percentages, and combined scores.

.EXAMPLE
Get-CIPPTenantAlignment
Retrieves tenant alignment data for all managed tenants.

.NOTES
This function provides insights into how well tenants comply with configured standards.
Alignment scores help identify tenants that may need attention or remediation.
#>

function Get-CIPPTenantAlignment {
    [CmdletBinding()]
    param ()

    Write-Verbose "Retrieving tenant alignment data"
    
    $endpoint = '/api/ListTenantAlignment'

    Invoke-CIPPRestMethod -Endpoint $endpoint
}
