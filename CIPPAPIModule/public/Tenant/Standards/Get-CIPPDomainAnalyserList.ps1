<#
.SYNOPSIS
Retrieves Domain Analyser results for customer tenants.

.DESCRIPTION
The Get-CIPPDomainAnalyserList function retrieves Domain Analyser results for customer tenants. It uses the Invoke-CIPPRestMethod function to make a REST API call to retrieve cached domain analysis results from the system.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which to retrieve domain analyser results. Use "AllTenants" to retrieve results for all tenants. This parameter is optional.

.EXAMPLE
Get-CIPPDomainAnalyserList
Retrieves Domain Analyser results for all customer tenants.

.EXAMPLE
Get-CIPPDomainAnalyserList -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves Domain Analyser results for the specified customer tenant.
#>

function Get-CIPPDomainAnalyserList {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)]
        [string]$CustomerTenantID = "AllTenants"
    )

    Write-Verbose "Getting Domain Analyser results for tenant $CustomerTenantID"
    $endpoint = '/api/DomainAnalyser_List'
    $params = @{
        tenantFilter = $CustomerTenantID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method 'GET'
}