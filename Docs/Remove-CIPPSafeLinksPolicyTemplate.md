# Remove-CIPPSafeLinksPolicyTemplate
## SYNOPSIS
Removes a Safe Links policy template from CIPP.
## DESCRIPTION
The Remove-CIPPSafeLinksPolicyTemplate function removes a specific Safe Links policy template from CIPP's template storage.
# PARAMETERS

## **-ID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the Safe Links policy template to remove. This parameter is mandatory.

  ## **-WhatIf**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \


  ## **-Confirm**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \


 #### EXAMPLE 1
```powershell
PS > Remove-CIPPSafeLinksPolicyTemplate -ID "StandardProtection.SafeLinksTemplate.json"
```

