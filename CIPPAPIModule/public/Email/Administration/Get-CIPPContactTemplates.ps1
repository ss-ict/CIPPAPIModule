<#
.SYNOPSIS
Retrieves contact templates from CIPP.

.DESCRIPTION
The Get-CIPPContactTemplates function retrieves contact templates stored in CIPP. 
You can retrieve all templates or a specific template by providing its ID.

.PARAMETER ID
Specifies the ID of a specific contact template to retrieve. This parameter is optional. 
If not provided, all contact templates will be retrieved.

.EXAMPLE
Get-CIPPContactTemplates
Retrieves all contact templates.

.EXAMPLE
Get-CIPPContactTemplates -ID "template123.ContactTemplate.json"
Retrieves a specific contact template by its ID.

.NOTES
This function queries CIPP's template storage and does not require a tenant filter.
#>

function Get-CIPPContactTemplates {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]$ID
    )

    Write-Verbose 'Retrieving contact templates'
    
    $endpoint = '/api/ListContactTemplates'
    $params = @{}
    
    if ($ID) {
        $params.ID = $ID
        Write-Verbose "Retrieving specific template: $ID"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
