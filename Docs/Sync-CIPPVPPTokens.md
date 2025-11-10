# Sync-CIPPVPPTokens
## SYNOPSIS
Synchronizes VPP (Volume Purchase Program) tokens for a specified customer tenant.
## DESCRIPTION
The Sync-CIPPVPPTokens function synchronizes VPP (Volume Purchase Program) tokens for a specified customer tenant. It uses the Invoke-CIPPRestMethod function to make a REST API call to start the VPP sync process for all valid VPP tokens in the tenant.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which to synchronize VPP tokens. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Sync-CIPPVPPTokens -CustomerTenantID "contoso.onmicrosoft.com"
```
 #### EXAMPLE 2
```powershell
PS > Sync-CIPPVPPTokens -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

