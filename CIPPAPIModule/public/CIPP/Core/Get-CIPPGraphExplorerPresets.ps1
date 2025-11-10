<#
.SYNOPSIS
Retrieves Graph Explorer presets from CIPP.

.DESCRIPTION
The Get-CIPPGraphExplorerPresets function retrieves saved Graph Explorer presets from CIPP. 
Presets are saved Graph API queries that can be shared or kept private. You can optionally filter presets by endpoint.

.PARAMETER Endpoint
Specifies an endpoint to filter the presets. This parameter is optional. 
If provided, only presets matching the specified endpoint will be returned.

.EXAMPLE
Get-CIPPGraphExplorerPresets
Retrieves all Graph Explorer presets (owned by you or shared with you).

.EXAMPLE
Get-CIPPGraphExplorerPresets -Endpoint "/users"
Retrieves Graph Explorer presets for the /users endpoint.

.NOTES
This function returns presets that you own or that have been shared with you.
#>

function Get-CIPPGraphExplorerPresets {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]$Endpoint
    )

    Write-Verbose "Retrieving Graph Explorer presets"
    
    $endpoint = '/api/ListGraphExplorerPresets'
    $params = @{}
    
    if ($Endpoint) {
        $params.Endpoint = $Endpoint
        Write-Verbose "Filtering by endpoint: $Endpoint"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
