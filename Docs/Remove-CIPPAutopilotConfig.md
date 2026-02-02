# Remove-CIPPAutopilotConfig
## SYNOPSIS
Removes an Autopilot configuration profile from a specified customer tenant.
## DESCRIPTION
The Remove-CIPPAutopilotConfig function removes an Autopilot configuration profile from a specified customer tenant. It uses the Invoke-CIPPRestMethod function to make a REST API call to delete the specified Autopilot profile.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant from which to remove the Autopilot configuration. This parameter is mandatory.

  ## **-ProfileId**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the Autopilot profile to remove. This parameter is mandatory.

  ## **-DisplayName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The display name of the Autopilot profile to remove. This parameter is optional.

  ## **-Assignments**
> ![Foo](https://img.shields.io/badge/Type-Array-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The assignments associated with the Autopilot profile. This parameter is optional.

 #### EXAMPLE 1
```powershell
PS > Remove-CIPPAutopilotConfig -CustomerTenantID "contoso.onmicrosoft.com" -ProfileId "12345678-1234-1234-1234-123456789abc"
```
 #### EXAMPLE 2
```powershell
PS > Remove-CIPPAutopilotConfig -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -ProfileId "87654321-4321-4321-4321-cba987654321" -DisplayName "Corporate Autopilot Profile"
```

