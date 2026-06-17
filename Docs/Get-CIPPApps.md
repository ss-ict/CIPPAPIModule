# Get-CIPPApps
## SYNOPSIS
Retrieves a list of apps for a specific customer tenant ID.
## DESCRIPTION
The Get-CIPPApps function retrieves a list of apps for a specific customer tenant ID by making a REST API call to the "/api/listapps" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the customer tenant ID for which to retrieve the apps.

  ## **-UseReportDB**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
When specified, retrieves the application list from the CIPP report database cache instead of live Microsoft Graph data. Use 'AllTenants' with this switch for cached cross-tenant data.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPApps -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPApps -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UseReportDB
```

