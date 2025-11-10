# Add-CIPPEquipmentMailbox
## SYNOPSIS
Adds an equipment mailbox to the specified customer tenant in Microsoft 365.
## DESCRIPTION
The Add-CIPPEquipmentMailbox function creates a new equipment mailbox using the provided details. It sends a POST request to the '/api/AddEquipmentMailbox' endpoint with the tenant filter, display name, username, and user principal name. This function is part of the CIPP API module for managing Microsoft 365 resources.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant where the equipment mailbox will be added. This parameter is mandatory.

  ## **-DisplayName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The display name for the equipment mailbox. This parameter is mandatory.

  ## **-Username**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The username for the equipment mailbox. This parameter is mandatory.

  ## **-UserPrincipalName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The user principal name (UPN) for the equipment mailbox. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Add-CIPPEquipmentMailbox -CustomerTenantID "12345678-1234-1234-1234-123456789012" -DisplayName "Conference Room A" -Username "confrooma" -UserPrincipalName "confrooma@contoso.com"

This example adds an equipment mailbox named "Conference Room A" with the specified username and UPN to the given tenant.
```

