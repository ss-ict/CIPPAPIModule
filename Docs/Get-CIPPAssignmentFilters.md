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

 #### EXAMPLE 1
```powershell
PS > Get-CIPPAssignmentFilters -CustomerTenantID "contoso.onmicrosoft.com"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPAssignmentFilters -CustomerTenantID "contoso.onmicrosoft.com" -FilterId "12345678-1234-1234-1234-123456789012"
```

