# Remove-CIPPDevice
## SYNOPSIS
Removes or performs actions on a device for a specified customer tenant.
## DESCRIPTION
The Remove-CIPPDevice function removes or performs actions on a device for a specified customer tenant. It uses the Invoke-CIPPRestMethod function to make a REST API call to perform the specified action on the device.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which to perform the device action. This parameter is mandatory.

  ## **-DeviceID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the device to perform the action on. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Remove-CIPPDevice -CustomerTenantID "contoso.onmicrosoft.com" -DeviceID "12345678-1234-1234-1234-123456789abc" -Action "delete"
```
 #### EXAMPLE 2
```powershell
PS > Remove-CIPPDevice -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -DeviceID "87654321-4321-4321-4321-cba987654321" -Action "disable"
```

