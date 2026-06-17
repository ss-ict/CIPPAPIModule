# Get-CIPPAssignmentFilters
## SYNOPSIS
Retrieves assignment filters from Microsoft Endpoint Manager.
## DESCRIPTION
The Get-CIPPAssignmentFilters function retrieves assignment filters from Microsoft Endpoint Manager (Intune) for a specified tenant. 
You can retrieve all assignment filters or a specific filter by providing its ID.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant. This parameter is mandatory.

  ## **-FilterId**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the ID of a specific assignment filter to retrieve. This parameter is optional.  If not provided, all assignment filters will be retrieved.

  ## **-UseReportDB**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
When specified, retrieves the assignment filter list from the CIPP report database cache instead of live Microsoft Graph data. Only applies when no -FilterId is supplied. Use 'AllTenants' with this switch for cached cross-tenant data.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPAssignmentFilters -CustomerTenantID "contoso.onmicrosoft.com"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPAssignmentFilters -CustomerTenantID "contoso.onmicrosoft.com" -FilterId "12345678-1234-1234-1234-123456789012"
```
 #### EXAMPLE 3
```powershell
PS > Get-CIPPAssignmentFilters -CustomerTenantID "contoso.onmicrosoft.com" -UseReportDB
```

