# Get-CIPPTenantDrift
## SYNOPSIS
Retrieves tenant drift data for standards configuration.
## DESCRIPTION
The Get-CIPPTenantDrift function retrieves drift data that shows changes or deviations from applied standards 
in managed tenants. This helps identify configuration drift over time.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the ID of the customer tenant to check for drift. This parameter is optional.  If not provided, drift data for all tenants will be retrieved.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPTenantDrift
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPTenantDrift -CustomerTenantID "contoso.onmicrosoft.com"
```

