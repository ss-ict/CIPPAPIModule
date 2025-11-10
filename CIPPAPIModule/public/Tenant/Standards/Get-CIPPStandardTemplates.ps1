<#
.SYNOPSIS
Retrieves standard templates from CIPP.

.DESCRIPTION
The Get-CIPPStandardTemplates function retrieves saved standard templates from CIPP. 
Standard templates define collections of best practices and configurations that can be applied to tenants.

.PARAMETER ID
Specifies the GUID of a specific standard template to retrieve. This parameter is optional. 
If not provided, all standard templates will be retrieved.

.EXAMPLE
Get-CIPPStandardTemplates
Retrieves all standard templates sorted by template name.

.EXAMPLE
Get-CIPPStandardTemplates -ID "12345678-1234-1234-1234-123456789012"
Retrieves a specific standard template by its GUID.

.NOTES
This function queries CIPP's template storage for StandardsTemplateV2 partition.
Templates include settings for excluded tenants and various standard configurations.
#>

function Get-CIPPStandardTemplates {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]$ID
    )

    Write-Verbose "Retrieving standard templates"
    
    $endpoint = '/api/listStandardTemplates'
    $params = @{}
    
    if ($ID) {
        $params.id = $ID
        Write-Verbose "Retrieving specific template: $ID"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
