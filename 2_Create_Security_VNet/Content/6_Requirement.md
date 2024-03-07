# VNet requirements
- First Subscription
    - Security Subscription
        - Would contain all security related resources and lock access to that subscription
        - Deploy a VNet within this subscription(security-vnet) to deploy tools to use for data analysis and vulnerability assessments
        - Resources that generate this information would live in a separate vnet(dev-vnet, uat-vnet, test-vnet and prod-vnet)
        - All these vnets should peer with security-vnet so that it can collect information for analysis
        - Requirement - All VNets should be able to setup a peering with security-vnet
        - All VNets are using same Azure AD Tenant
        - We can create a service principal within that Azure AD tenant and create custom role on that security subscription that allows that Service Principal to create VNet Peerings
        