# Remove-CIPPScheduledItem
## SYNOPSIS
Removes a scheduled item from CIPP.
## DESCRIPTION
The Remove-CIPPScheduledItem function removes a scheduled task from CIPP's scheduler. 
This includes removing both the task entry and its associated details.
# PARAMETERS

## **-ID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID (RowKey) of the scheduled item to remove. This parameter is mandatory.

  ## **-WhatIf**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \


  ## **-Confirm**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \


 #### EXAMPLE 1
```powershell
PS > Remove-CIPPScheduledItem -ID "12345678-1234-1234-1234-123456789012"
```

