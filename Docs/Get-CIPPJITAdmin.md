# Get-CIPPJITAdmin
## SYNOPSIS
Retrieves Just-In-Time (JIT) admin users from Azure AD.
## DESCRIPTION
The Get-CIPPJITAdmin function retrieves users with Just-In-Time admin access configured in Azure AD. 
JIT admin provides temporary elevated permissions that expire automatically. 
You can retrieve JIT admin users for a specific tenant or all tenants.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant. This parameter is mandatory. Use "AllTenants" to retrieve JIT admin users across all managed tenants.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPJITAdmin -CustomerTenantID "contoso.onmicrosoft.com"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPJITAdmin -CustomerTenantID "AllTenants"
```

