# Azure AD Provider

```
provider "azure_ad" {
    version     = "=0.6.0"
    subscription_id = var.subscription_id
    tenant_id       = var.tenant_id
    client_id       = var.client_id
}
```

- Environment Variables
- Same Environment variables as we saw earlier
    - There are quite a few environment variables that are supported by Azure AD provider as well
    - ARM_CLIENT_ID
        - The Client ID which should be used. Service Principal ID
    - ARM_CLIENT_SECRET
        - The Client Secret which should be used. Service Principal Secret
    - ARM_ENVIRONMENT
        - Azure Environment - Public, Gov etc.
    - ARM_SUBSCRIPTION_ID 
        - The Subscription ID which should be used. Azure Subscription ID
    - ARM_TENANT_ID 
        - The Tenant ID which should be used. Tenant ID for Service Principal
    - ARM_MSI_ENDPOINT 
        - The path to a custom endpoint for Managed Identity - in most circumstances, this should be detected automatically.