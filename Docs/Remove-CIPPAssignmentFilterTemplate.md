# Remove-CIPPAssignmentFilterTemplate
## SYNOPSIS
Removes an assignment filter template from CIPP.
## DESCRIPTION
The Remove-CIPPAssignmentFilterTemplate function removes a specific assignment filter template from CIPP's template storage.
# PARAMETERS

## **-ID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the assignment filter template to remove. This parameter is mandatory.

  ## **-WhatIf**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \


  ## **-Confirm**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \


 #### EXAMPLE 1
```powershell
PS > Remove-CIPPAssignmentFilterTemplate -ID "template-12345"
```

