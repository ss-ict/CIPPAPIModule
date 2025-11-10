<#
.SYNOPSIS
Retrieves Safe Links policy templates from CIPP.

.DESCRIPTION
The Get-CIPPSafeLinksPolicyTemplates function retrieves Safe Links policy templates stored in CIPP. 
These templates can be used to create Safe Links policies in Microsoft Defender for Office 365.

.PARAMETER ID
Specifies the ID of a specific Safe Links policy template to retrieve. This parameter is optional. 
If not provided, all Safe Links policy templates will be retrieved.

.EXAMPLE
Get-CIPPSafeLinksPolicyTemplates
Retrieves all Safe Links policy templates.

.EXAMPLE
Get-CIPPSafeLinksPolicyTemplates -ID "StandardProtection.SafeLinksTemplate.json"
Retrieves a specific Safe Links policy template by its ID.

.NOTES
This function queries CIPP's template storage and does not require a tenant filter.
#>

function Get-CIPPSafeLinksPolicyTemplates {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]$ID
    )

    Write-Verbose "Retrieving Safe Links policy templates"
    
    $endpoint = '/api/ListSafeLinksPolicyTemplates'
    $params = @{}
    
    if ($ID) {
        $params.ID = $ID
        Write-Verbose "Retrieving specific template: $ID"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
