<#
.SYNOPSIS
Retrieves restricted users from Exchange Online.

.DESCRIPTION
The Get-CIPPRestrictedUsers function retrieves users from the restricted senders list in Exchange Online. 
These are users who have been blocked from sending email due to exceeding sending limits or other restrictions.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant. This parameter is mandatory.

.EXAMPLE
Get-CIPPRestrictedUsers -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves all restricted users for the specified tenant.

.NOTES
This function requires appropriate Exchange Online permissions through the CIPP API.
The function enhances the blocked user information with parsed details including:
- BlockType: Description of why the user was blocked
- InternalCount: Number of internal recipients contacted
- ExternalCount: Number of external recipients contacted
- TemporaryBlock: Whether the block is temporary
#>

function Get-CIPPRestrictedUsers {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Retrieving restricted users for tenant: $CustomerTenantID"
    
    $endpoint = '/api/ListRestrictedUsers'
    $params = @{
        tenantFilter = $CustomerTenantID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
