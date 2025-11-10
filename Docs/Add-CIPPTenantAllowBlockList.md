# Add-CIPPTenantAllowBlockList
## SYNOPSIS
Adds entries to the tenant allow/block list for specified customer tenants.
## DESCRIPTION
The Add-CIPPTenantAllowBlockList function adds entries to the tenant allow/block list for specified customer tenants. It uses the Invoke-CIPPRestMethod function to make a REST API call to create the allow/block list items.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant(s) for which to add the allow/block list entries. Use "AllTenants" to apply to all tenants. This parameter is mandatory.

  ## **-Entries**
> ![Foo](https://img.shields.io/badge/Type-Object-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The entries to add to the allow/block list. Can be an array of entries or a comma/semicolon-separated string. This parameter is mandatory.

  ## **-ListType**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The type of list entry (e.g., "Sender", "Url", "FileHash"). This parameter is mandatory.

  ## **-ListMethod**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The method for the list entry (e.g., "Allow" or "Block"). This parameter is mandatory.

  ## **-Notes**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Optional notes for the allow/block list entry.

  ## **-NoExpiration**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Switch parameter to indicate the entry should not expire.

  ## **-RemoveAfter**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Switch parameter to indicate the entry should be removed after 45 days.

 #### EXAMPLE 1
```powershell
PS > Add-CIPPTenantAllowBlockList -CustomerTenantID "contoso.onmicrosoft.com" -Entries "example@contoso.com" -ListType "Sender" -ListMethod "Allow" -Notes "Trusted sender"
```
 #### EXAMPLE 2
```powershell
PS > Add-CIPPTenantAllowBlockList -CustomerTenantID "AllTenants" -Entries @("malicious.com", "phishing.net") -ListType "Url" -ListMethod "Block" -NoExpiration
```

