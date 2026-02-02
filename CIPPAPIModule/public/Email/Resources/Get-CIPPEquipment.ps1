<#
.SYNOPSIS
Retrieves equipment mailbox records for a given customer tenant.

.DESCRIPTION
Get-CIPPEquipment calls the CIPP API endpoint '/api/ListEquipment' to obtain equipment mailbox information for the specified CustomerTenantID. If an EquipmentID is provided, the results are filtered to that specific equipment; otherwise all equipment for the tenant are returned. The function relies on Invoke-CIPPRestMethod to perform the REST call and supports standard PowerShell common parameters such as -Verbose.

.PARAMETER CustomerTenantID
The tenant identifier used to filter equipment records. This parameter is mandatory.

.PARAMETER EquipmentID
Optional. When provided, restricts the returned results to the equipment item with this ID.

.EXAMPLE
# Retrieve all equipment for a tenant
Get-CIPPEquipment -CustomerTenantID 'contoso.onmicrosoft.com'

.EXAMPLE
# Retrieve a specific equipment item for a tenant
Get-CIPPEquipment -CustomerTenantID 'contoso.onmicrosoft.com' -EquipmentID 'equip-1234'

.OUTPUTS
The function returns the raw response from Invoke-CIPPRestMethod, typically a deserialized object or collection representing equipment entries.

.NOTES
- Uses the HTTP GET method against '/api/ListEquipment'.
- Use -Verbose to display diagnostic information about the operation.
#>
function Get-CIPPEquipment {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [string]$EquipmentID
    )

    Write-Verbose "Getting equipment mailboxes for $CustomerTenantID"

    $endpoint = '/api/ListEquipment'
    $params = @{
        tenantFilter = $CustomerTenantID
        EquipmentID  = $EquipmentID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}