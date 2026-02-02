# Remove-CIPPDeletedObject
## SYNOPSIS
Permanently removes a deleted object from Azure AD.
## DESCRIPTION
The Remove-CIPPDeletedObject function permanently removes a deleted object (user, group, application, etc.) 
from the Azure AD recycle bin. This action is irreversible.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant. This parameter is mandatory.

  ## **-ID**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the deleted object to permanently remove. This parameter is mandatory.

  ## **-WhatIf**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \


  ## **-Confirm**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \


 #### EXAMPLE 1
```powershell
PS > Remove-CIPPDeletedObject -CustomerTenantID "contoso.onmicrosoft.com" -ID "12345678-1234-1234-1234-123456789012"
```

