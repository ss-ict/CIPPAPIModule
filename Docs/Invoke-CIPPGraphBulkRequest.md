# Invoke-CIPPGraphBulkRequest
## SYNOPSIS
Executes multiple Microsoft Graph API requests in a single bulk operation.
## DESCRIPTION
The Invoke-CIPPGraphBulkRequest function allows you to execute multiple Microsoft Graph GET requests in a single bulk operation. 
This improves performance when you need to retrieve multiple resources from the Graph API. You can optionally disable pagination for specific request IDs.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant. This parameter is mandatory.

  ## **-Requests**
> ![Foo](https://img.shields.io/badge/Type-Array-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies an array of request objects to execute. Each request should contain an id, url, and method (GET). This parameter is mandatory.

  ## **-AsApp**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to use application permissions instead of delegated permissions. This parameter is optional.

  ## **-NoPaginateIds**
> ![Foo](https://img.shields.io/badge/Type-Array-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies an array of request IDs that should not be paginated. This parameter is optional.

 #### EXAMPLE 1
```powershell
PS > $requests = @(
)
Invoke-CIPPGraphBulkRequest -CustomerTenantID "contoso.onmicrosoft.com" -Requests $requests
Executes multiple Graph API requests in a single bulk operation.
```
 #### EXAMPLE 2
```powershell
PS > $requests = @(
Invoke-CIPPGraphBulkRequest -CustomerTenantID "contoso.onmicrosoft.com" -Requests $requests -NoPaginateIds @("1")
Executes a Graph API request without pagination.
```

