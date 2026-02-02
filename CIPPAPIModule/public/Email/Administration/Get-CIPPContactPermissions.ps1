<#
.SYNOPSIS
Retrieves contact folder permissions for a mailbox.

.DESCRIPTION
The Get-CIPPContactPermissions function retrieves contact folder permissions for a specified mailbox in Exchange Online. 
This includes information about who has access to the contact folder and their permission levels.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant. This parameter is mandatory.

.PARAMETER UserID
Specifies the user ID (UPN or email address) of the mailbox owner. This parameter is mandatory.

.EXAMPLE
Get-CIPPContactPermissions -CustomerTenantID "contoso.onmicrosoft.com" -UserID "john.doe@contoso.com"
Retrieves contact folder permissions for the specified user's mailbox.

.NOTES
This function requires appropriate Exchange Online permissions through the CIPP API.
#>

function Get-CIPPContactPermissions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID
    )

    Write-Verbose "Retrieving contact permissions for user: $UserID in tenant: $CustomerTenantID"
    
    $endpoint = '/api/ListContactPermissions'
    $params = @{
        tenantFilter = $CustomerTenantID
        UserID       = $UserID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
