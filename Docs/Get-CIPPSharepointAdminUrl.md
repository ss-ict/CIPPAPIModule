# Get-CIPPSharepointAdminUrl
## SYNOPSIS
Retrieves the SharePoint admin URL for a tenant.
## DESCRIPTION
The Get-CIPPSharepointAdminUrl function retrieves the SharePoint admin center URL for a specified tenant. 
You can optionally return the URL as data or be redirected to the SharePoint admin center.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant. This parameter is mandatory.

  ## **-ReturnUrl**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to return the URL as data instead of redirecting. This parameter is optional.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPSharepointAdminUrl -CustomerTenantID "contoso.onmicrosoft.com" -ReturnUrl
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPSharepointAdminUrl -CustomerTenantID "contoso.onmicrosoft.com"
```

