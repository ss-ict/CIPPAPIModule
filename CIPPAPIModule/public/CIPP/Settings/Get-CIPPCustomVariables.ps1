<#
.SYNOPSIS
Retrieves custom variables from CIPP.

.DESCRIPTION
The Get-CIPPCustomVariables function retrieves custom variables configured in CIPP. 
These variables can be used for text replacement in various CIPP operations. 
The function returns both reserved system variables and custom user-defined variables.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant to filter tenant-specific variables. This parameter is optional. 
If not provided, only global variables will be retrieved.

.PARAMETER ExcludeSystemVariables
When specified, excludes system-level reserved variables from the results. 
By default, system variables are included.

.EXAMPLE
Get-CIPPCustomVariables
Retrieves all global custom variables and reserved variables including system variables.

.EXAMPLE
Get-CIPPCustomVariables -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves custom variables for a specific tenant, including tenant-specific overrides.

.EXAMPLE
Get-CIPPCustomVariables -ExcludeSystemVariables
Retrieves custom variables excluding system-level reserved variables like %systemroot%, %temp%, etc.

.EXAMPLE
Get-CIPPCustomVariables -CustomerTenantID "contoso.onmicrosoft.com" -ExcludeSystemVariables
Retrieves tenant-specific custom variables without system variables.

.NOTES
Reserved variables include tenant-specific values like %tenantid%, %tenantname%, and system variables like %systemroot%, %temp%.
Custom variables can be defined globally (AllTenants) or per-tenant and will override global settings when specified.
System variables are included by default unless -ExcludeSystemVariables is specified.
#>

function Get-CIPPCustomVariables {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [switch]$ExcludeSystemVariables
    )

    Write-Verbose "Retrieving custom variables"
    
    $endpoint = '/api/ListCustomVariables'
    $params = @{}
    
    if ($CustomerTenantID) {
        $params.tenantFilter = $CustomerTenantID
        Write-Verbose "Retrieving variables for tenant: $CustomerTenantID"
    }
    
    if ($ExcludeSystemVariables.IsPresent) {
        $params.includeSystem = 'false'
        Write-Verbose "Excluding system variables"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
