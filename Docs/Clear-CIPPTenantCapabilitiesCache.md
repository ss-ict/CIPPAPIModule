# Clear-CIPPTenantCapabilitiesCache
## SYNOPSIS
Removes cached tenant capabilities data from CIPP.
## DESCRIPTION
The Clear-CIPPTenantCapabilitiesCache function clears the cached tenant capabilities data for a specified tenant. 
This forces CIPP to refresh the capabilities information on the next request.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant. This parameter is mandatory.

  ## **-WhatIf**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \


  ## **-Confirm**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \


 #### EXAMPLE 1
```powershell
PS > Clear-CIPPTenantCapabilitiesCache -CustomerTenantID "contoso.onmicrosoft.com"
```

