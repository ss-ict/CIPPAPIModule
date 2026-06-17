# Get-CIPPCalendarPerms
## SYNOPSIS
Retrieves calendar permissions for a user in a specified customer tenant.
## DESCRIPTION
The Get-CIPPCalendarPerms function retrieves the calendar permissions for a user in a specified customer tenant using the CIPP API. It sends a request to the "/api/listcalendarpermissions" endpoint with the provided customer tenant ID and user ID.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The ID of the user. Optional; omit to retrieve calendar permissions for all mailboxes. Cannot be combined with -UseReportDB (the cached report only covers all mailboxes).

  ## **-UseReportDB**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
When specified, retrieves calendar permissions from the CIPP report database cache instead of live Exchange Online data. The backend only serves cached data when no UserID is supplied. Use 'AllTenants' with this switch for cached cross-tenant data.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPCalendarPerms -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "john.doe@example.com"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPCalendarPerms -CustomerTenantID "contoso.onmicrosoft.com" -UseReportDB
```

