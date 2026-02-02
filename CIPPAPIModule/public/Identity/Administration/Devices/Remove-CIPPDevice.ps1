<#
.SYNOPSIS
Removes or performs actions on a device for a specified customer tenant.

.DESCRIPTION
The Remove-CIPPDevice function removes or performs actions on a device for a specified customer tenant. It uses the Invoke-CIPPRestMethod function to make a REST API call to perform the specified action on the device.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which to perform the device action. This parameter is mandatory.

.PARAMETER DeviceID
The ID of the device to perform the action on. This parameter is mandatory.

.EXAMPLE
Remove-CIPPDevice -CustomerTenantID "contoso.onmicrosoft.com" -DeviceID "12345678-1234-1234-1234-123456789abc" -Action "delete"
Deletes the specified device from the customer tenant.

.EXAMPLE
Remove-CIPPDevice -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -DeviceID "87654321-4321-4321-4321-cba987654321" -Action "disable"
Disables the specified device in the customer tenant.
#>

function Remove-CIPPDevice {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$DeviceID
    )

    Write-Verbose "Performing action '$Action' on device $DeviceID for tenant $CustomerTenantID"
    $endpoint = '/api/ExecDeviceDelete'
    $body = @{
        tenantFilter = $CustomerTenantID
        ID           = $DeviceID
        action       = 'Delete'
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}