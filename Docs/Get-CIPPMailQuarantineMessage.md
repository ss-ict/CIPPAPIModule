# Get-CIPPMailQuarantineMessage
## SYNOPSIS
Retrieves a quarantined email message from Exchange Online.
## DESCRIPTION
The Get-CIPPMailQuarantineMessage function retrieves a specific quarantined email message from Exchange Online 
and exports it in EML format. This allows you to view the full message content including headers and body.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant. This parameter is mandatory.

  ## **-Identity**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the identity (ID) of the quarantined message. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPMailQuarantineMessage -CustomerTenantID "contoso.onmicrosoft.com" -Identity "c14401cf-aa9a-465b-cfd5-08d0f0d1993f\4c2ca98e-94ea-db3a-7eb8-3b63657d4db7"
```

