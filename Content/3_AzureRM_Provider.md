# AzureRM Provider
- [AzureRM Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
- Provider name - azurerm
- We could create a configuration block - Refer below

```
provider "azurerm"{
    version          = "~1.0"
    alias            = "networking"
    subscription_id  = var.subscription_id
    client_id        = var.client_id
    client_secret    = var.client_secret
}
```
- Explanation
    - Whatever is specified after provider keyword is the actual provider name
    - With azure, that Value would be fixed to "azurerm"
    - With version, we tell TF that we are ok to use 1.x(1.1, 1.2, 1.3) etc. but not 2.0 and above
    - We can create alias that helps us deal with multiple providers

- Environment variables
    - There are quite a few environment variables that are supported by Azure
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

- For more details, refer [here](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)