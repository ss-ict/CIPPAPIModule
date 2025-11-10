# Get-CIPPAdminPortalLicenses
## SYNOPSIS
Retrieves admin portal licenses for a specified customer tenant.
## DESCRIPTION
The Get-CIPPAdminPortalLicenses function retrieves admin portal licenses for a specified customer tenant. It uses the Invoke-CIPPRestMethod function to make a REST API call to retrieve the license information from the Microsoft Admin Portal.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which to retrieve admin portal licenses. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPAdminPortalLicenses -CustomerTenantID "contoso.onmicrosoft.com"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPAdminPortalLicenses -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

