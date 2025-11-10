# Clear-CIPPRiskyUser
## SYNOPSIS
Dismisses the risk status for a risky user in a specified customer tenant.
## DESCRIPTION
The Clear-CIPPRiskyUser function dismisses the risk status for a risky user in a specified customer tenant. It uses the Invoke-CIPPRestMethod function to make a REST API call to dismiss the user's risk status in Azure AD Identity Protection.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which to dismiss the risky user. This parameter is mandatory.

  ## **-UserId**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the user to dismiss risk for. This parameter is mandatory.

  ## **-UserDisplayName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The display name of the user to dismiss risk for. This parameter is optional but recommended for logging purposes.

 #### EXAMPLE 1
```powershell
PS > Clear-CIPPRiskyUser -CustomerTenantID "contoso.onmicrosoft.com" -UserId "12345678-1234-1234-1234-123456789abc" -UserDisplayName "John Doe"
```
 #### EXAMPLE 2
```powershell
PS > Clear-CIPPRiskyUser -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserId "87654321-4321-4321-4321-cba987654321"
```

