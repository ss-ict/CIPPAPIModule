# Get-CIPPMailboxRules
## SYNOPSIS
Retrieves mailbox rules for a specified customer tenant ID.
## DESCRIPTION
The Get-CIPPMailboxRules function retrieves mailbox rules for a specified customer tenant ID by making a REST API call to the "/api/listmailboxrules" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The customer tenant ID for which to retrieve mailbox rules.

  ## **-UseReportDB**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
When specified, retrieves mailbox rules from the CIPP report database cache instead of live Exchange Online data. Use 'AllTenants' with this switch for cached cross-tenant data.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPMailboxRules -CustomerTenantID "contoso.onmicrosoft.com"

This example retrieves mailbox rules for the customer tenant with the ID "contoso.onmicrosoft.com".
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPMailboxRules -CustomerTenantID "contoso.onmicrosoft.com" -UseReportDB

This example retrieves cached mailbox rules for the "contoso.onmicrosoft.com" tenant from the report database.
```

