<#
.SYNOPSIS
Dismisses the risk status for a risky user in a specified customer tenant.

.DESCRIPTION
The Clear-CIPPRiskyUser function dismisses the risk status for a risky user in a specified customer tenant. It uses the Invoke-CIPPRestMethod function to make a REST API call to dismiss the user's risk status in Azure AD Identity Protection.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which to dismiss the risky user. This parameter is mandatory.

.PARAMETER UserId
The ID of the user to dismiss risk for. This parameter is mandatory.

.PARAMETER UserDisplayName
The display name of the user to dismiss risk for. This parameter is optional but recommended for logging purposes.

.EXAMPLE
Clear-CIPPRiskyUser -CustomerTenantID "contoso.onmicrosoft.com" -UserId "12345678-1234-1234-1234-123456789abc" -UserDisplayName "John Doe"
Dismisses the risk status for the specified user in the customer tenant.

.EXAMPLE
Clear-CIPPRiskyUser -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserId "87654321-4321-4321-4321-cba987654321"
Dismisses the risk status for the specified user without providing display name.
#>

function Clear-CIPPRiskyUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserId,
        [Parameter(Mandatory = $false)]
        [string]$UserDisplayName
    )

    Write-Verbose "Dismissing risky user $UserId for tenant $CustomerTenantID"
    $endpoint = '/api/ExecDismissRiskyUser'
    $body = @{
        tenantFilter = $CustomerTenantID
        userId       = $UserId
    }

    if ($PSBoundParameters.ContainsKey('UserDisplayName')) {
        $body.userDisplayName = $UserDisplayName
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}