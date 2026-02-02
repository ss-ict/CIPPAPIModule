<#
.SYNOPSIS
Executes multiple Microsoft Graph API requests in a single bulk operation.

.DESCRIPTION
The Invoke-CIPPGraphBulkRequest function allows you to execute multiple Microsoft Graph GET requests in a single bulk operation. 
This improves performance when you need to retrieve multiple resources from the Graph API. You can optionally disable pagination for specific request IDs.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant. This parameter is mandatory.

.PARAMETER Requests
Specifies an array of request objects to execute. Each request should contain an id, url, and method (GET). This parameter is mandatory.

.PARAMETER AsApp
Specifies whether to use application permissions instead of delegated permissions. This parameter is optional.

.PARAMETER NoPaginateIds
Specifies an array of request IDs that should not be paginated. This parameter is optional.

.EXAMPLE
$requests = @(
    @{ id = "1"; url = "/users"; method = "GET" }
    @{ id = "2"; url = "/groups"; method = "GET" }
)
Invoke-CIPPGraphBulkRequest -CustomerTenantID "contoso.onmicrosoft.com" -Requests $requests
Executes multiple Graph API requests in a single bulk operation.

.EXAMPLE
$requests = @(
    @{ id = "1"; url = "/users?`$top=5"; method = "GET" }
)
Invoke-CIPPGraphBulkRequest -CustomerTenantID "contoso.onmicrosoft.com" -Requests $requests -NoPaginateIds @("1")
Executes a Graph API request without pagination.

.NOTES
This function only supports GET requests. Each request must have a unique id within the batch.
This function is probably not that useful and not suitable for the API module.
#>

function Invoke-CIPPGraphBulkRequest {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [array]$Requests,
        [Parameter(Mandatory = $false)]
        [switch]$AsApp,
        [Parameter(Mandatory = $false)]
        [array]$NoPaginateIds
    )

    Write-Verbose "Executing bulk Graph request for tenant: $CustomerTenantID with $($Requests.Count) requests"
    
    $endpoint = '/api/ListGraphBulkRequest'
    $body = @{
        tenantFilter = $CustomerTenantID
        requests     = $Requests
    }
    
    if ($AsApp.IsPresent -eq $true) {
        $body.asApp = $true
        Write-Verbose 'Using application permissions'
    }
    
    if ($NoPaginateIds) {
        $body.noPaginateIds = $NoPaginateIds
        Write-Verbose "Disabling pagination for request IDs: $($NoPaginateIds -join ', ')"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
