<#
.SYNOPSIS
Removes a CIPP group.

.DESCRIPTION
The Remove-CIPPGroup function is used to remove a CIPP group from the specified customer tenant.

.PARAMETER CustomerTenantID
The ID of the customer tenant.

.PARAMETER GroupID
The ID of the group to be removed.

.PARAMETER Grouptype
The type of the group.

.PARAMETER DisplayName
The display name of the group.

.EXAMPLE
Remove-CIPPGroup -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -GroupID "98765432-1234-5678-9012-34567890ABCD" -Grouptype "Security" -DisplayName "Admins"
This example removes a group with the specified ID, type, and display name from the customer tenant with the specified ID.

#>
function Remove-CIPPGroup {
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [guid]$GroupID,
        [Parameter(Mandatory = $true)]
        [string]$GroupType,
        [Parameter(Mandatory = $true)]
        [string]$DisplayName
    )

    Write-Verbose "Removing group: $GroupID"

    $endpoint = '/api/ExecGroupsDelete'
    $Body = @{
        tenantFilter = $CustomerTenantID
        ID           = $GroupID
        GroupType    = $GroupType
        DisplayName  = $DisplayName
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $Body -Method POST
    
}