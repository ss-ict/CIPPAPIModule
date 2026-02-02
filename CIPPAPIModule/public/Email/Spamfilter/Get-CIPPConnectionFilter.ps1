<#
.SYNOPSIS
Retrieves connection filter policies from Exchange Online.

.DESCRIPTION
The Get-CIPPConnectionFilter function retrieves hosted connection filter policies from Exchange Online for a specified tenant. 
Connection filters are used to control which IP addresses can connect to your organization.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant. This parameter is mandatory.

.EXAMPLE
Get-CIPPConnectionFilter -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves all connection filter policies for the specified tenant.

.NOTES
This function requires appropriate Exchange Online permissions through the CIPP API.
#>

function Get-CIPPConnectionFilter {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Retrieving connection filter policies for tenant: $CustomerTenantID"
    
    $endpoint = '/api/ListConnectionFilter'
    $params = @{
        tenantFilter = $CustomerTenantID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
