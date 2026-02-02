# Get-CIPPStandardsCompare
## SYNOPSIS
Retrieves and compares applied standards across tenants.
## DESCRIPTION
The Get-CIPPStandardsCompare function retrieves the current state of applied standards across all managed tenants 
or a specific tenant. This allows you to compare which standards are applied and their configurations.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the ID of the customer tenant to filter results. This parameter is optional.  If not provided, standards for all tenants will be retrieved.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPStandardsCompare
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPStandardsCompare -CustomerTenantID "contoso.onmicrosoft.com"
```

