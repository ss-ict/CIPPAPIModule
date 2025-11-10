<#
.SYNOPSIS
Adds an enrollment configuration for AutoPilot.

.DESCRIPTION
The Add-CIPPAutopilotEnrollment function adds an enrollment configuration for AutoPilot devices for a specified customer tenant. It sends a request to the "/api/AddEnrollment" endpoint with the provided enrollment details.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which the enrollment configuration will be added.

.PARAMETER ShowProgress
Specifies whether to show progress during enrollment.

.PARAMETER BlockDevice
Specifies whether to block the device during enrollment.

.PARAMETER AllowReset
Specifies whether to allow device reset during enrollment.

.PARAMETER EnableLog
Specifies whether to enable logging during enrollment.

.PARAMETER ErrorMessage
Custom error message to display if enrollment fails.

.PARAMETER TimeOutInMinutes
Timeout value in minutes for the enrollment process.

.PARAMETER AllowFail
Specifies whether to allow the enrollment to fail without blocking.

.PARAMETER OBEEOnly
Specifies whether to use OOBE (Out-of-Box Experience) only.

.PARAMETER InstallWindowsUpdates
Specifies whether to install Windows updates during enrollment.

.EXAMPLE
Add-CIPPAutopilotEnrollment -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -ShowProgress $true -BlockDevice $false -AllowReset $true

Adds an enrollment configuration with progress shown, device not blocked, and reset allowed.

.EXAMPLE
Add-CIPPAutopilotEnrollment -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -ShowProgress $true -BlockDevice $true -AllowReset $false -EnableLog $true -TimeOutInMinutes 30 -InstallWindowsUpdates $true

Adds an enrollment configuration with comprehensive settings including logging and Windows updates.

#>

function Add-CIPPAutopilotEnrollment {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [bool]$ShowProgress = $true,
        [Parameter(Mandatory = $false)]
        [bool]$BlockDevice = $false,
        [Parameter(Mandatory = $false)]
        [bool]$AllowReset = $true,
        [Parameter(Mandatory = $false)]
        [bool]$EnableLog = $false,
        [Parameter(Mandatory = $false)]
        [string]$ErrorMessage,
        [Parameter(Mandatory = $false)]
        [int]$TimeOutInMinutes,
        [Parameter(Mandatory = $false)]
        [bool]$AllowFail = $false,
        [Parameter(Mandatory = $false)]
        [bool]$OBEEOnly = $false,
        [Parameter(Mandatory = $false)]
        [bool]$InstallWindowsUpdates = $false
    )

    Write-Verbose "Adding enrollment configuration for $CustomerTenantID"

    $endpoint = '/api/AddEnrollment'
    $body = @{
        selectedTenants       = @{ value = $CustomerTenantID }
        ShowProgress          = $ShowProgress
        blockDevice           = $BlockDevice
        AllowReset            = $AllowReset
        EnableLog             = $EnableLog
        ErrorMessage          = $ErrorMessage
        TimeOutInMinutes      = $TimeOutInMinutes
        AllowFail             = $AllowFail
        OBEEOnly              = $OBEEOnly
        InstallWindowsUpdates = $InstallWindowsUpdates
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method 'POST'
}