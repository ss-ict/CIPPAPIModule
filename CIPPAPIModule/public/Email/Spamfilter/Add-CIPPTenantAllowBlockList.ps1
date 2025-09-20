<#
.SYNOPSIS
Adds entries to the tenant allow/block list for specified customer tenants.

.DESCRIPTION
The Add-CIPPTenantAllowBlockList function adds entries to the tenant allow/block list for specified customer tenants. It uses the Invoke-CIPPRestMethod function to make a REST API call to create the allow/block list items.

.PARAMETER CustomerTenantID
The ID of the customer tenant(s) for which to add the allow/block list entries. Use "AllTenants" to apply to all tenants. This parameter is mandatory.

.PARAMETER Entries
The entries to add to the allow/block list. Can be an array of entries or a comma/semicolon-separated string. This parameter is mandatory.

.PARAMETER ListType
The type of list entry (e.g., "Sender", "Url", "FileHash"). This parameter is mandatory.

.PARAMETER ListMethod
The method for the list entry (e.g., "Allow" or "Block"). This parameter is mandatory.

.PARAMETER Notes
Optional notes for the allow/block list entry.

.PARAMETER NoExpiration
Switch parameter to indicate the entry should not expire.

.PARAMETER RemoveAfter
Switch parameter to indicate the entry should be removed after 45 days.

.EXAMPLE
Add-CIPPTenantAllowBlockList -CustomerTenantID "contoso.onmicrosoft.com" -Entries "example@contoso.com" -ListType "Sender" -ListMethod "Allow" -Notes "Trusted sender"
Adds the specified sender to the allow list for the customer tenant.

.EXAMPLE
Add-CIPPTenantAllowBlockList -CustomerTenantID "AllTenants" -Entries @("malicious.com", "phishing.net") -ListType "Url" -ListMethod "Block" -NoExpiration
Adds the specified URLs to the block list for all tenants with no expiration.
#>

function Add-CIPPTenantAllowBlockList {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        $Entries,
        [Parameter(Mandatory = $true)]
        [string]$ListType,
        [Parameter(Mandatory = $true)]
        [string]$ListMethod,
        [Parameter(Mandatory = $false)]
        [string]$Notes,
        [Parameter(Mandatory = $false)]
        [switch]$NoExpiration,
        [Parameter(Mandatory = $false)]
        [switch]$RemoveAfter
    )

    Write-Verbose "Adding tenant allow/block list entries for tenant $CustomerTenantID"
    $endpoint = '/api/AddTenantAllowBlockList'
    $body = @{
        tenantId   = $CustomerTenantID
        entries    = $Entries
        listType   = $ListType
        listMethod = $ListMethod
    }

    if ($PSBoundParameters.ContainsKey('Notes')) {
        $body.notes = $Notes
    }

    if ($NoExpiration.IsPresent) {
        $body.NoExpiration = $true
    }

    if ($RemoveAfter.IsPresent) {
        $body.RemoveAfter = $true
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}