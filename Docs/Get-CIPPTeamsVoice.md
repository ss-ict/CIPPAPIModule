# Get-CIPPTeamsVoice
## SYNOPSIS
Retrieves teams voice information for a specified customer tenant ID.
## DESCRIPTION
The Get-CIPPTeamsVoice function retrieves teams voice information for a specified customer tenant ID. It makes use of the Invoke-CIPPRestMethod function to send a request to the "/api/listteamsvoice" endpoint with the provided tenant filter.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The customer tenant ID for which to retrieve teams voice information. This parameter is mandatory.

  ## **-UseReportDB**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
When specified, retrieves Teams voice information from the CIPP report database cache instead of live data. Use 'AllTenants' with this switch for cached cross-tenant data.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPTeamsVoice -CustomerTenantID "contoso.onmicrosoft.com"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPTeamsVoice -CustomerTenantID "contoso.onmicrosoft.com" -UseReportDB
```

