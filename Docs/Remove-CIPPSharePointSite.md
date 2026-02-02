# Remove-CIPPSharePointSite
## SYNOPSIS
Removes a SharePoint site from a specified customer tenant.
## DESCRIPTION
The Remove-CIPPSharePointSite function removes a SharePoint site from a specified customer tenant. It uses the Invoke-CIPPRestMethod function to make a REST API call to delete the site. The function handles both regular SharePoint sites and group-connected sites automatically.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant from which to remove the SharePoint site. This parameter is mandatory.

  ## **-SiteId**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the SharePoint site to remove. This must be a valid GUID. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Remove-CIPPSharePointSite -CustomerTenantID "contoso.onmicrosoft.com" -SiteId "12345678-1234-1234-1234-123456789abc"
```
 #### EXAMPLE 2
```powershell
PS > Remove-CIPPSharePointSite -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -SiteId "87654321-4321-4321-4321-cba987654321"
```

