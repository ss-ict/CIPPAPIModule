# Get-CIPPIntuneScript
## SYNOPSIS
Retrieves Intune scripts from Microsoft Endpoint Manager.
## DESCRIPTION
The Get-CIPPIntuneScript function retrieves Intune scripts (including PowerShell, shell scripts, remediation scripts, and Linux scripts) 
from Microsoft Endpoint Manager for a specified tenant. The function retrieves all script types in a single operation.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant. This parameter is mandatory.

  ## **-UseReportDB**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
When specified, retrieves Intune scripts from the CIPP report database cache instead of live Microsoft Graph data. Use 'AllTenants' with this switch for cached cross-tenant data.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPIntuneScript -CustomerTenantID "contoso.onmicrosoft.com"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPIntuneScript -CustomerTenantID "contoso.onmicrosoft.com" -UseReportDB
```

