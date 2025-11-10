# Remove-CIPPQuarantinePolicy
## SYNOPSIS
Removes a quarantine policy from Exchange Online.
## DESCRIPTION
The Remove-CIPPQuarantinePolicy function removes a quarantine policy from Exchange Online for a specified tenant.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant. This parameter is mandatory.

  ## **-Name**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the name of the quarantine policy to remove. This parameter is mandatory.

  ## **-Identity**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the identity (GUID) of the quarantine policy. This parameter is mandatory.

  ## **-WhatIf**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \


  ## **-Confirm**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \


 #### EXAMPLE 1
```powershell
PS > Remove-CIPPQuarantinePolicy -CustomerTenantID "contoso.onmicrosoft.com" -Name "CustomPolicy" -Identity "12345678-1234-1234-1234-123456789012"
```

