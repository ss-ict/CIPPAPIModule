# Add-CIPPAutopilotEnrollment
## SYNOPSIS
Adds an enrollment configuration for AutoPilot.
## DESCRIPTION
The Add-CIPPAutopilotEnrollment function adds an enrollment configuration for AutoPilot devices for a specified customer tenant. It sends a request to the "/api/AddEnrollment" endpoint with the provided enrollment details.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which the enrollment configuration will be added.

  ## **-ShowProgress**
> ![Foo](https://img.shields.io/badge/Type-Boolean-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-True-Blue?color=5547a8)\
Specifies whether to show progress during enrollment.

  ## **-BlockDevice**
> ![Foo](https://img.shields.io/badge/Type-Boolean-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to block the device during enrollment.

  ## **-AllowReset**
> ![Foo](https://img.shields.io/badge/Type-Boolean-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-True-Blue?color=5547a8)\
Specifies whether to allow device reset during enrollment.

  ## **-EnableLog**
> ![Foo](https://img.shields.io/badge/Type-Boolean-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to enable logging during enrollment.

  ## **-ErrorMessage**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Custom error message to display if enrollment fails.

  ## **-TimeOutInMinutes**
> ![Foo](https://img.shields.io/badge/Type-Int32-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-0-Blue?color=5547a8)\
Timeout value in minutes for the enrollment process.

  ## **-AllowFail**
> ![Foo](https://img.shields.io/badge/Type-Boolean-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to allow the enrollment to fail without blocking.

  ## **-OBEEOnly**
> ![Foo](https://img.shields.io/badge/Type-Boolean-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to use OOBE (Out-of-Box Experience) only.

  ## **-InstallWindowsUpdates**
> ![Foo](https://img.shields.io/badge/Type-Boolean-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to install Windows updates during enrollment.

 #### EXAMPLE 1
```powershell
PS > Add-CIPPAutopilotEnrollment -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -ShowProgress $true -BlockDevice $false -AllowReset $true

Adds an enrollment configuration with progress shown, device not blocked, and reset allowed.
```
 #### EXAMPLE 2
```powershell
PS > Add-CIPPAutopilotEnrollment -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -ShowProgress $true -BlockDevice $true -AllowReset $false -EnableLog $true -TimeOutInMinutes 30 -InstallWindowsUpdates $true

Adds an enrollment configuration with comprehensive settings including logging and Windows updates.
```

