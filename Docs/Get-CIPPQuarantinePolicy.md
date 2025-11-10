# Get-CIPPQuarantinePolicy
## SYNOPSIS
Retrieves quarantine policies from Exchange Online.
## DESCRIPTION
The Get-CIPPQuarantinePolicy function retrieves quarantine policies from Exchange Online for a specified tenant. 
Quarantine policies define what users can do with quarantined messages.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant. This parameter is mandatory.

  ## **-Type**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-QuarantinePolicy-Blue?color=5547a8)\
Specifies the quarantine policy type. Valid values are 'QuarantinePolicy' and 'GlobalQuarantinePolicy'.  This parameter is optional and defaults to 'QuarantinePolicy'.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPQuarantinePolicy -CustomerTenantID "contoso.onmicrosoft.com"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPQuarantinePolicy -CustomerTenantID "contoso.onmicrosoft.com" -Type "GlobalQuarantinePolicy"
```

