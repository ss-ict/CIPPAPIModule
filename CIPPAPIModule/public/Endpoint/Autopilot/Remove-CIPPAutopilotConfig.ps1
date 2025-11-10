<#
.SYNOPSIS
Removes an Autopilot configuration profile from a specified customer tenant.

.DESCRIPTION
The Remove-CIPPAutopilotConfig function removes an Autopilot configuration profile from a specified customer tenant. It uses the Invoke-CIPPRestMethod function to make a REST API call to delete the specified Autopilot profile.

.PARAMETER CustomerTenantID
The ID of the customer tenant from which to remove the Autopilot configuration. This parameter is mandatory.

.PARAMETER ProfileId
The ID of the Autopilot profile to remove. This parameter is mandatory.

.PARAMETER DisplayName
The display name of the Autopilot profile to remove. This parameter is optional.

.PARAMETER Assignments
The assignments associated with the Autopilot profile. This parameter is optional.

.EXAMPLE
Remove-CIPPAutopilotConfig -CustomerTenantID "contoso.onmicrosoft.com" -ProfileId "12345678-1234-1234-1234-123456789abc"
Removes the Autopilot configuration with the specified profile ID from the customer tenant "contoso.onmicrosoft.com".

.EXAMPLE
Remove-CIPPAutopilotConfig -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -ProfileId "87654321-4321-4321-4321-cba987654321" -DisplayName "Corporate Autopilot Profile"
Removes the Autopilot configuration with the specified profile ID and display name from the customer tenant.
#>

function Remove-CIPPAutopilotConfig {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$ProfileId,
        [Parameter(Mandatory = $false)]
        [string]$DisplayName,
        [Parameter(Mandatory = $false)]
        [array]$Assignments
    )

    Write-Verbose "Removing Autopilot configuration $ProfileId for tenant $CustomerTenantID"
    $endpoint = '/api/RemoveAutopilotConfig'
    $body = @{
        tenantFilter = $CustomerTenantID
        ID           = $ProfileId
    }

    if ($PSBoundParameters.ContainsKey('DisplayName')) {
        $body.displayName = $DisplayName
    }

    if ($PSBoundParameters.ContainsKey('Assignments')) {
        $body.assignments = $Assignments
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method 'POST'
}