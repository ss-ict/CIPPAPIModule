# Remove-CIPPQueuedAlert
## SYNOPSIS
Removes a queued alert from CIPP.
## DESCRIPTION
The Remove-CIPPQueuedAlert function removes a specific queued alert from CIPP's alert queue.
# PARAMETERS

## **-ID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the queued alert to remove. This parameter is mandatory.

  ## **-WhatIf**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \


  ## **-Confirm**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \


 #### EXAMPLE 1
```powershell
PS > Remove-CIPPQueuedAlert -ID "alert-12345"
```

