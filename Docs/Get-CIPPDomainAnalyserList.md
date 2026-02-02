# Get-CIPPDomainAnalyserList
## SYNOPSIS
Retrieves Domain Analyser results for customer tenants.
## DESCRIPTION
The Get-CIPPDomainAnalyserList function retrieves Domain Analyser results for customer tenants. It uses the Invoke-CIPPRestMethod function to make a REST API call to retrieve cached domain analysis results from the system.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-AllTenants-Blue?color=5547a8)\
The ID of the customer tenant for which to retrieve domain analyser results. Use "AllTenants" to retrieve results for all tenants. This parameter is optional.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPDomainAnalyserList
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPDomainAnalyserList -CustomerTenantID "contoso.onmicrosoft.com"
```

