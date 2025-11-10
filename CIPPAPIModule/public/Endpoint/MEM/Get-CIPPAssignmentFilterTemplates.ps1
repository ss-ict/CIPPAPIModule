<#
.SYNOPSIS
Retrieves assignment filter templates from CIPP.

.DESCRIPTION
The Get-CIPPAssignmentFilterTemplates function retrieves assignment filter templates stored in CIPP. 
These templates can be used to create assignment filters in Microsoft Endpoint Manager.

.PARAMETER ID
Specifies the ID (GUID) of a specific assignment filter template to retrieve. This parameter is optional. 
If not provided, all assignment filter templates will be retrieved.

.EXAMPLE
Get-CIPPAssignmentFilterTemplates
Retrieves all assignment filter templates.

.EXAMPLE
Get-CIPPAssignmentFilterTemplates -ID "12345678-1234-1234-1234-123456789012"
Retrieves a specific assignment filter template by its GUID.

.NOTES
This function queries CIPP's template storage and does not require a tenant filter.
#>

function Get-CIPPAssignmentFilterTemplates {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]$ID
    )

    Write-Verbose "Retrieving assignment filter templates"
    
    $endpoint = '/api/ListAssignmentFilterTemplates'
    $params = @{}
    
    if ($ID) {
        $params.ID = $ID
        Write-Verbose "Retrieving specific template: $ID"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
