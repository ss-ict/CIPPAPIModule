<#
.SYNOPSIS
Retrieves custom data mappings from CIPP.

.DESCRIPTION
The Get-CIPPCustomDataMappings function retrieves custom data mappings configured in CIPP. 
These mappings define how data from extensions is synchronized to directory objects. 
You can filter results by tenant, source type, and directory object type.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant to filter mappings. This parameter is optional.

.PARAMETER SourceType
Specifies the source type to filter mappings (e.g., "Extension", "Manual"). This parameter is optional.

.PARAMETER DirectoryObject
Specifies the directory object type to filter mappings (e.g., "User", "Group", "Device"). This parameter is optional.

.EXAMPLE
Get-CIPPCustomDataMappings
Retrieves all custom data mappings.

.EXAMPLE
Get-CIPPCustomDataMappings -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves custom data mappings for a specific tenant.

.EXAMPLE
Get-CIPPCustomDataMappings -SourceType "Extension" -DirectoryObject "User"
Retrieves custom data mappings filtered by source type and directory object.

.NOTES
This function is used to manage custom data synchronization configurations in CIPP.
#>

function Get-CIPPCustomDataMappings {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [ValidateSet('extensionSync', 'manualEntry')]
        [string]$SourceType,
        [Parameter(Mandatory = $false)]
        [ValidateSet('User')]
        [string]$DirectoryObject
    )

    Write-Verbose 'Retrieving custom data mappings'
    
    $endpoint = '/api/ListCustomDataMappings'
    $params = @{}
    
    if ($CustomerTenantID) {
        $params.tenantFilter = $CustomerTenantID
        Write-Verbose "Filtering by tenant: $CustomerTenantID"
    }
    
    if ($SourceType) {
        $params.sourceType = $SourceType
        Write-Verbose "Filtering by source type: $SourceType"
    }
    
    if ($DirectoryObject) {
        $params.directoryObject = $DirectoryObject
        Write-Verbose "Filtering by directory object: $DirectoryObject"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
