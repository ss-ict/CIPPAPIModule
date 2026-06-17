<#
.SYNOPSIS
Retrieves Intune policies for a specific customer.

.DESCRIPTION
The Get-CIPPIntunePolicy function retrieves Intune policies for a specific customer based on the provided parameters. It uses the Invoke-CIPPRestMethod function to make the request to the API.

.PARAMETER CustomerTenantID
The ID of the customer's tenant.

.PARAMETER PolicyID
The ID of the policy. This parameter is optional.

.PARAMETER Urlname
The URL name. This parameter is optional.

.PARAMETER UseReportDB
When specified, retrieves the Intune policy list from the CIPP report database cache instead of live Microsoft Graph data. Only applies to the list view (when no -PolicyID is supplied). Use 'AllTenants' with this switch for cached cross-tenant data.

.EXAMPLE
Get-CIPPIntunePolicy -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -PolicyID "policy123" -Urlname "example"
This example retrieves the Intune policies for the customer with the tenant ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778", using the policy ID "policy123" and the URL name "example".

.EXAMPLE
Get-CIPPIntunePolicy -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
This example retrieves all Intune policies for the customer with the tenant ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.EXAMPLE
Get-CIPPIntunePolicy -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UseReportDB
This example retrieves the cached Intune policy list for the customer tenant from the report database.

#>
Function Get-CIPPIntunePolicy {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [string]$PolicyID,
        [Parameter(Mandatory = $false)]
        [string]$Urlname,
        [Parameter(Mandatory = $false)]
        [switch]$UseReportDB
    )

    Write-Verbose "Getting Intune policies for customer: $CustomerTenantID"

    # Validation to ensure both $PolicyID and $urlname are supplied together
    if (($PolicyID -and -not $urlname) -or (-not $PolicyID -and $urlname)) {
        throw 'You must supply both -PolicyID and -Urlname parameters together or not at all.'
    }
    
    # Define the endpoint and parameters
    $endpoint = '/api/listintunepolicy'
    $params = @{
        tenantFilter = $CustomerTenantID
        URLName      = $urlname
        id           = $PolicyID
        UseReportDB  = $UseReportDB.IsPresent
    }
    
    # Use the Invoke-CIPPRequest function to make the request
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}