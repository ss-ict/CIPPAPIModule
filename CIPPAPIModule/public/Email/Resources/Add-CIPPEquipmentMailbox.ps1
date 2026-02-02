<#
.SYNOPSIS
    Adds an equipment mailbox to the specified customer tenant in Microsoft 365.

.DESCRIPTION
    The Add-CIPPEquipmentMailbox function creates a new equipment mailbox using the provided details. It sends a POST request to the '/api/AddEquipmentMailbox' endpoint with the tenant filter, display name, username, and user principal name. This function is part of the CIPP API module for managing Microsoft 365 resources.

.PARAMETER CustomerTenantID
    The ID of the customer tenant where the equipment mailbox will be added. This parameter is mandatory.

.PARAMETER DisplayName
    The display name for the equipment mailbox. This parameter is mandatory.

.PARAMETER Username
    The username for the equipment mailbox. This parameter is mandatory.

.PARAMETER UserPrincipalName
    The user principal name (UPN) for the equipment mailbox. This parameter is mandatory.

.EXAMPLE
    Add-CIPPEquipmentMailbox -CustomerTenantID "12345678-1234-1234-1234-123456789012" -DisplayName "Conference Room A" -Username "confrooma" -UserPrincipalName "confrooma@contoso.com"
    
    This example adds an equipment mailbox named "Conference Room A" with the specified username and UPN to the given tenant.

.NOTES
    This function requires appropriate permissions to create equipment mailboxes in the target tenant. Ensure that the Invoke-CIPPRestMethod cmdlet is available and configured correctly.
#>

function Add-CIPPEquipmentMailbox {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$DisplayName,
        [Parameter(Mandatory = $true)]
        [string]$Username,
        [Parameter(Mandatory = $true)]
        [string]$UserPrincipalName
    )

    Write-Verbose "Adding equipment mailbox '$DisplayName' for $CustomerTenantID"

    $endpoint = '/api/AddEquipmentMailbox'
    $body = @{
        tenantID          = $CustomerTenantID
        displayName       = $DisplayName
        username          = $Username
        userPrincipalName = $UserPrincipalName
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method 'POST'
}