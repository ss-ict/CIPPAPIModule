# Test-CIPPPublicPing
## SYNOPSIS
Tests connectivity to the CIPP API using the public ping endpoint.
## DESCRIPTION
This function sends a GET request to the CIPP public ping endpoint to prevent cold starts and verify API availability.
# PARAMETERS

## **-CIPPPublicURL**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The base URL for the GUI of the CIPP instance (e.g., 'https://cipp.domain.com'). No trailing slash.

 #### EXAMPLE 1
```powershell
PS > Test-CIPPPublicPing -CIPPPublicURL 'https://cipp.domain.com'
```

