# Get-CIPPMailboxForwarding
## SYNOPSIS
Retrieves mailbox forwarding configuration for a specified customer tenant.
## DESCRIPTION
The Get-CIPPMailboxForwarding function retrieves mailbox forwarding configuration for a specified customer tenant by making a REST API call to the "/api/ListMailboxForwarding" endpoint. It can query live Exchange Online data or cached report database data when UseReportDB is specified.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The customer tenant ID or default domain name for which to retrieve mailbox forwarding configuration.

  ## **-UseReportDB**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
When specified, retrieves mailbox forwarding configuration from the CIPP report database cache instead of live Exchange Online data. Use 'AllTenants' with this switch for cached cross-tenant data.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPMailboxForwarding -CustomerTenantID "contoso.onmicrosoft.com"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPMailboxForwarding -CustomerTenantID "contoso.onmicrosoft.com" -UseReportDB
```

